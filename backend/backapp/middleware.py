from django.contrib.auth.models import User

class FakeAuthMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        # Simulando autenticação para um usuário específico
        user = User.objects.get_or_create(username='usuario_teste')[0]
        request.user = user
        return self.get_response(request)
