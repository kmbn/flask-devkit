"""Tests for the web app."""
import pytest

from flask_app.app import app


@pytest.fixture
def client():
    app.config["TESTING"] = True
    yield app.test_client()


def test_hello(client):
    """Requests to root must return `Hello World!`"""
    r = client.get("/")
    expected = b"Hello World!"

    assert r.data == expected
