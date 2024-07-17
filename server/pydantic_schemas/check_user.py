from pydantic import BaseModel

# check user / login user
class CheckUser(BaseModel):
    email: str
    password: str
    