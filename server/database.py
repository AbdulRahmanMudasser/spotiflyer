from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

# database connection
DATABASE_URL = 'postgresql://postgres:5421@localhost:5432/spotify'

# open connection
engine = create_engine(DATABASE_URL)

# create session
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# to access database
def get_db():
    db = SessionLocal()
    
    try:
        yield db
    finally:
        db.close()