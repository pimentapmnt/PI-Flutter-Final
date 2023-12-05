from django.shortcuts import render
from django.contrib.auth.hashers import make_password
from django.contrib.auth.hashers import check_password
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse, HttpResponse
from django.views.decorators.csrf import csrf_exempt
from .models import Usuario
import json
from rest_framework.parsers import JSONParser
from .models import Inscricao , Jogo
from django.views import View
from django.utils import timezone
from django.views.decorators.http import require_http_methods
import logging
from django.core.mail import send_mail
from django.template.loader import render_to_string



@csrf_exempt
def registrar_usuario(request):
    if request.method == 'POST':
        try:
            valores = json.loads(request.body)
            email = valores.get('email')
            senha = valores.get('senha')
            senha_cripto = make_password(senha)
            usuario = Usuario(email=email, senha=senha_cripto)
            usuario.save()
            response = JsonResponse({"message": "Registro bem-sucedido"})
            response["Access-Control-Allow-Methods"] = "OPTIONS, POST"
            return response
        except Exception as e:
            return JsonResponse({"message": str(e)})
    else:
        return JsonResponse({"message": "Método inválido"})

@require_http_methods(["GET", "POST"])  # Aceita GET e POST    
@csrf_exempt
def fazer_login(request):
    logger = logging.getLogger(__name__)
    if request.method == 'GET':
        return JsonResponse({"message": "Método GET funcionando para fazer_login"})
    elif request.method == 'POST':
        try:
            data = json.loads(request.body.decode('utf-8'))
            email = data.get('email', '')
            senha = data.get('senha', '')
            # Verificar se o usuário existe no banco de dados
            usuario = Usuario.objects.get(email=email)
            if check_password(senha, usuario.senha):
                request.session['id_usuario'] = usuario.idUsuario
                logger.info('ID do usuário definido na sessão: %s', usuario.idUsuario)
                return JsonResponse({"message": "Login bem-sucedido"})
            else:
                return JsonResponse({"message":"Senha ou Usuario incorreto"})
        except Usuario.DoesNotExist:
            return JsonResponse({"message": "Credenciais inválidas"}, status=401)
        except Exception as e:
            return JsonResponse({"message": str(e)}, status=500)
    else:
        return JsonResponse({"message": "Método inválido"}, status=405)

    
@require_http_methods(["GET", "POST"])  # Aceita GET e POST
@csrf_exempt
@login_required
def receber_inscricao(request):
    logger = logging.getLogger(__name__)
    if request.method == 'POST':
        id_u = request.session.get('id_usuario')
        logger.info(f"fora do try ID do usuário: {id_u}")
        try:
            data = json.loads(request.body.decode('utf-8'))
            logger.info(f"Dados no data: {data}")
            # id_usuario = request.session.get(Usuario.idUsuario)
            # logger.info(f"ID do usuário: {id_usuario}") # Ajuste conforme sua lógica de autenticação
            id_jogo = request.POST.get('idJogo')
            # logger.info(f"ID do jogo: {id_jogo}")
            id_usuario = 2
            id_jogo = 3
            logger.info(f"ID do usuário: {id_usuario}")
            logger.info(f"ID do jogo: {id_jogo}")
            # jogo = Jogo.objects.get(idJogo=id_jogo)
            # logger.info(f"Nome do jogo: {jogo}")
            try:
                usuario = Usuario.objects.get(idUsuario=id_usuario)
                request.session['nome'] = usuario.email
                logger.info(logger.info(f"id do Usuario: {usuario}"))
                logger.info(logger.info(f"Nome do Usuario: {usuario.email}"))
            except Jogo.DoesNotExist:
                return JsonResponse({"message": "Usuario não encontrado"}, status=404)
            try:
                jogo = Jogo.objects.get(idJogo=id_jogo)
                logger.info(f"Nome do jogo: {jogo}")
                mensagem = "Dados da Inscrição:\n"  # Inicializando a variável mensagem
                for chave, valor in data.items():
                    mensagem += f"{chave}: {valor}\n"
                mensagem += f"Nome do Jogo: {jogo}\n"
                mensagem += f"Nome do Usuario: {usuario.email}\n"
            except Jogo.DoesNotExist:
                return JsonResponse({"message": "Jogo não encontrado"}, status=404)
            inscricao = Inscricao(
                idJogo_id=id_jogo,
                idUsuario_id=id_u,
                nomeUsuario = data.get('nameUsuario', ''),
                sobrenome= data.get('sobrenome', ''),
                email=data.get('email', ''),
                nicknamejogo=data.get('nicknamejogo', ''),
                rankJogo=data.get('rankJogo', ''),
                personagemJogo=data.get('personagemJogo', ''),
                experiencia=data.get('experiencia', ''),
                disponibilidade=data.get('disponibilidade', ''),
                raMaua=data.get('raMaua', '')
            )

            inscricao.save()
            # Enviando o email com os dados da inscrição
            send_mail(
                'Inscrição',
                mensagem,
                'backendmauaespt@outlook.com',
                ['mauaesportadm@gmail.com'],
                fail_silently=False,
            )
            return JsonResponse({"message": "Inscrição salva com sucesso"})
        except Exception as e:
            logger.exception("Erro ao salvar inscrição")
            return JsonResponse({"message": f"Erro: {str(e)}"}, status=500)
          
    else:
        return JsonResponse({"message": "Método inválido"}, status=405)
    
def envia_email(request):
    send_mail('Inscrição', 'Teste do email', 'backendmauaespt@outlook.com', ['mauaesportadm@gmail.com'])
    return HttpResponse('Olá')

            #nomeU = data.get('nameUsuario', ''),
            # sobnome= data.get('sobrenome', ''),
            # emails=data.get('email', ''),
            # nickjogo=data.get('nicknamejogo', ''),
            # rank=data.get('rankJogo', ''),
            # personJogo=data.get('personagemJogo', ''),
            # exp=data.get('experiencia', ''),
            # disp=data.get('disponibilidade', ''),
            # ra=data.get('raMaua', '')
            # send_mail('Inscrição', ['Jogo = ',jogo, 'Id do Usuario = ',id_usuario, 'Nome do Usuario = ', nomeU,'Sobrenome = ',sobnome, 'email = ', emails, 'Nickname no Jogo = ',nickjogo,'Rank no jogo =',rank, 'Personagem(s) do jogo(se tiver) = ', personJogo,"Tempo de experiencia = ",exp, "Disponibilidade = ",disp, "R.A = ", ra], 'backendmauaespt@outlook.com', ['mauaesportadm@gmail.com'])

            #             dados_inscricao = {
            # 'Nome do Usuário': inscricao.nomeUsuario,
            # 'Sobrenome': inscricao.sobrenome,
            # 'Email': inscricao.email,
            # 'Nickname no Jogo': inscricao.nicknamejogo,
            # 'Rank do Jogo': inscricao.rankJogo,
            # 'Personagem do Jogo': inscricao.personagemJogo,
            # 'Experiência': inscricao.experiencia,
            # 'Disponibilidade': inscricao.disponibilidade,
            # 'RA Mauá': inscricao.raMaua,
            # }
            # mensagem = dados_inscricao
            # # send_mail('Inscrição', 'Teste do email', 'backendmauaespt@outlook.com', ['mauaesportadm@gmail.com'])
            # send_mail('Inscrição', mensagem, 'backendmauaespt@outlook.com', ['mauaesportadm@gmail.com'])