from fastapi.middleware.cors import CORSMiddleware
from fastapi import FastAPI
from routes import auth
from models.base import Base
from database import engine
from host import Host
import uvicorn

# instance of fastapi
app = FastAPI()

# cors configuration
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"], 
    allow_credentials=True,
    allow_methods=["GET", "POST", "PUT", "DELETE", "OPTIONS"],
    allow_headers=["Authorization", "Content-Type"],
)

# include routes
app.include_router(auth.router, prefix='/auth')

# create tables in database 
Base.metadata.create_all(engine)

# run the server with uvicorn
if __name__ == "__main__":
    uvicorn.run(app, host=Host.HOST_ADDRESS, port=Host.PORT)
