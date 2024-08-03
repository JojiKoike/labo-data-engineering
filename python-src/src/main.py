from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root() -> dict[str, str]:
    """read_root."""
    return {"Hello": "World"}


@app.get("/item/{item_id}")
def read_item(item_id: int, q: str) -> dict[str, object]:
    """read_item."""
    return {"item_id": item_id, "q": q}
