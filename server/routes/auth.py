from fastapi import HTTPException, APIRouter, Depends
from pydantic_schemas.create_user import CreateUser
from pydantic_schemas.check_user import CheckUser
from sqlalchemy.orm import Session
from models.user import User
from database import get_db
import uuid
import bcrypt

router = APIRouter()

# signup route
@router.post('/signup', status_code=201)
def signup_user(user: CreateUser, db: Session=Depends(get_db)):
    # extract data coming from request
    print(user.name)
    print(user.email)
    print(user.password)

    # check user if it already exists in database
    user_db = db.query(User).filter(User.email == user.email).first()

    if user_db:
        raise HTTPException(400, 'User With Same Email Already Exists')

    # hash the password
    hash_password = bcrypt.hashpw(user.password.encode(), bcrypt.gensalt())
    
    # add the user to database 
    user_db = User(id=str(uuid.uuid4()), name=user.name, email=user.email, password=hash_password)
    db.add(user_db)
    
    # commit changes to database
    db.commit()
    
    # refresh all the attributes of user_db
    db.refresh(user_db)
    
    # return the user_db
    return user_db

# login route
@router.post('/login')
def login_user(user: CheckUser, db: Session=Depends(get_db)):
    # check if user with the same email already exists
    user_db = db.query(User).filter(User.email == user.email).first()
    
    if not user_db:
        raise HTTPException(400, "User With This Email Does Not Exists")
    
    # check password if it valid or not
    is_valid = bcrypt.checkpw(user.password.encode(), user_db.password)
    
    if not is_valid:
        raise HTTPException(400, "Incorrect Password")
    
    # return the user_db
    return user_db
