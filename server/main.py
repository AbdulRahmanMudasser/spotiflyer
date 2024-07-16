from fastapi import FastAPI
from routes import auth
from models.base import Base
from database import engine

# instance of fastapi
app = FastAPI()

# include routes
app.include_router(auth.router, prefix='/auth')

# create tables in database 
Base.metadata.create_all(engine)