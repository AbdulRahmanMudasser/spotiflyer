from pydantic import BaseModel

# create user / signup user
class CreateUser(BaseModel):
    name: str
    email: str
    password: str
    