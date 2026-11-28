import pytest

from app import add, subtract, multiply, divide


def test_addition():
    assert add(2, 2) == 4


def test_subtraction():
    assert subtract(5, 4) == 1


def test_multiplication():
    assert multiply(2, 3) == 6


def test_division():
    assert divide(10, 2) == 5


def test_division_by_zero():
    with pytest.raises(ValueError):
        divide(10, 0)