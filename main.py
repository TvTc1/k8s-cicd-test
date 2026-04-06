from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "V4 突击版本！CI/CD 自动化太爽了！"}