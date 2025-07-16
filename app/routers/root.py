from fastapi import APIRouter, Request
from fastapi.responses import HTMLResponse
from templating import templates

router = APIRouter(
    prefix="",
    tags=["root"],
    responses={404: {"description": "Not found"}},
)


@router.get("/", response_class=HTMLResponse)
def root(request: Request):
    return templates.TemplateResponse("index.html", {"request": request})


