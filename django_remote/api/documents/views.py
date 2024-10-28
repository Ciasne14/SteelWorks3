"""Defining views for documents"""

from http import HTTPStatus
from django.http import HttpRequest

from ninja import Router
from ninja.pagination import LimitOffsetPagination, paginate


from documents.schemas import SensorIn, DocumentIn
from documents.controllers import (
    chat,
)


router = Router(tags=["Documents"])

@router.get("/my_chat/")
def echo_view(request):
    return chat(request)

