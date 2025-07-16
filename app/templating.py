from fastapi.templating import Jinja2Templates

templates = Jinja2Templates(directory="templates")
templates.env.add_extension("jinja2.ext.do")