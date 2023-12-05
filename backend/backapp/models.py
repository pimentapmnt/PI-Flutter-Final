from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User


class Jogo(models.Model):
    idJogo = models.IntegerField(primary_key=True)
    nomeJogo = models.CharField(max_length=60)

    def __str__(self):
        return self.nomeJogo
    class Meta:
        db_table = 'jogo'

class Usuario(models.Model):
    idUsuario = models.AutoField(primary_key=True)  # Campo de auto incremento
    email = models.CharField(max_length=255, unique = True)
    senha = models.CharField(max_length=255)

    class Meta:
        db_table = 'usuario'  # Nome da tabela existente no banco de dados


# Adicionando related_name='inscricoes' aos campos de chave estrangeira (idJogo e idUsuario), você poderá acessar as inscrições associadas a um jogo ou usuário de uma maneira mais clara. Por exemplo:
# # Acessando as inscrições de um jogo específico
# jogo = Jogo.objects.get(idJogo=1)
# inscricoes_do_jogo = jogo.inscricoes.all()

# # Acessando as inscrições de um usuário específico
# usuario = Usuario.objects.get(idUsuario=1)
# inscricoes_do_usuario = usuario.inscricoes.all()

class Inscricao(models.Model):
    idInscricao = models.AutoField(primary_key=True)
    idJogo = models.ForeignKey('Jogo', db_column='idJogo', on_delete=models.CASCADE)
    idUsuario = models.ForeignKey('auth.User', db_column='idUsuario', on_delete=models.CASCADE)
    nomeUsuario = models.CharField(max_length=60)
    sobrenome = models.CharField(max_length=60)
    email = models.CharField(max_length=60)
    nicknamejogo = models.CharField(max_length=60)
    rankJogo = models.CharField(max_length=60)
    personagemJogo = models.CharField(max_length=60, blank=True, null=True)
    experiencia = models.TextField()
    disponibilidade = models.CharField(max_length=60)
    raMaua = models.CharField(max_length=60)
    datapreenchimento = models.DateTimeField(default=timezone.now)
    
    class Meta:
        managed = False
        db_table = 'inscricao'

    def save(self, *args, **kwargs):
        # Define a lógica para ajustar o fuso horário para Brasília antes de salvar
        # (você pode precisar instalar a biblioteca pytz para trabalhar com fuso horário)
        # Exemplo de ajuste para o fuso horário de Brasília
        import pytz
        tz = pytz.timezone('America/Sao_Paulo')
        self.datapreenchimento = timezone.now().astimezone(tz)
        super().save(*args, **kwargs)
        