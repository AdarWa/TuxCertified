from fastapi import APIRouter, Request
from fastapi.responses import HTMLResponse
from templating import templates

router = APIRouter(
    prefix="/report",
    tags=["report"],
    responses={404: {"description": "Not found"}},
)

@router.get("/show/{name}", response_class=HTMLResponse)
def results(name: str,request: Request):
    laptop = {
        "model": "Lenovo X1 Carbon Gen 9"
    }

    reports = [
        {
            "id": 1,
            "distro": "Ubuntu 24.04",
            "kernel": "6.9.1",
            "submitted": "2025-06-29",
            "submitted_by": "anonymous",
            "features": {
                "wifi": True,
                "suspend": True,
                "fingerprint": False,
                "bluetooth": True,
            },
            "verified_count": 3,
            "verified_manually": False,
            "notes": "Works great except fingerprint reader.",
            "comments": [
                {"user": "user123", "comment": "WiFi and suspend work fine!"},
            ],
            "tags": ["Intel WiFi", "Wayland OK"],
            "warnings": [],
            "upvotes": 10
        }
    ]

    return templates.TemplateResponse("laptop.html", {"request": request, "laptop":laptop, "reports":reports})

@router.get("/", response_class=HTMLResponse)
def report(request: Request):
    features = ["wifi", "suspend", "fingerprint", "bluetooth"]
    return templates.TemplateResponse("report.html", {"request": request, "features": features})
