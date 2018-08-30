from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^polls/', include(('polls.urls', 'polls'), namespace='polls')),
    url(r'^admin/', admin.site.urls)
]
