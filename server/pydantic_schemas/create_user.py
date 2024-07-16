from pydantic import BaseModel

# create user
class CreateUser(BaseModel):
    name: str
    email: str
    password: str