from fastapi import FastAPI
from dotenv import load_dotenv
from fastapi.staticfiles import StaticFiles

from routers import root, report

load_dotenv()

app = FastAPI()

app.mount("/static", StaticFiles(directory="static"), name="static")

# Handle routers
app.include_router(root.router)
app.include_router(report.router)