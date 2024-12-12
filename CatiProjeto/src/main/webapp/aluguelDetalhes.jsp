<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Atualizar Endereço</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	
	

    <div class="container mt-5">
        <h2>Atualizar Endereço do Aluguel</h2>
        <form id="formEndereco">

            <div class="form-group">
                <label for="entregaCEP">CEP:</label>
                <input type="text" class="form-control" id="entregaCEP" name="entregaCEP">
            </div>

            <div class="form-group">
                <label for="entregaEndereco">Endereço:</label>
                <input type="text" class="form-control" id="entregaEndereco" name="entregaEndereco">
            </div>

            <div class="form-group">
                <label for="entregaNumero">Número:</label>
                <input type="text" class="form-control" id="entregaNumero" name="entregaNumero">
            </div>

            <div class="form-group">
                <label for="entregaCompl">Complemento:</label>
                <input type="text" class="form-control" id="entregaCompl" name="entregaCompl">
            </div>

            <div class="form-group">
                <label for="entregaBairro">Bairro:</label>
                <input type="text" class="form-control" id="entregaBairro" name="entregaBairro">
            </div>

            <div class="form-group">
                <label for="entregaCidade">Cidade:</label>
                <input type="text" class="form-control" id="entregaCidade" name="entregaCidade">
            </div>

            <div class="form-group">
                <label for="entregaUF">UF:</label>
                <input type="text" class="form-control" id="entregaUF" name="entregaUF">
            </div>

            <div class="form-group">
                <label for="entregaTelefone">Telefone:</label>
                <input type="text" class="form-control" id="entregaTelefone" name="entregaTelefone">
            </div>

            <div class="form-group">
                <label for="entregaRefer">Referência:</label>
                <input type="text" class="form-control" id="entregaRefer" name="entregaRefer">
            </div>

            <button type="button" class="btn btn-primary" id="atualizarBtn">Atualizar Endereço</button>
        </form>

        <div id="resultado" class="mt-3" style="display: none;"></div>

        <div id="botaoPedido" class="mt-3" style="display: none;">
            <a id="linkPedido" class="btn btn-success" href="#">Ir para Pedido</a>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            // Função para pegar o ID do aluguel da URL
            function getIdFromURL() {
                const urlParams = new URLSearchParams(window.location.search);
                return urlParams.get('idAluguel');
            }

            // Função para limpar o formulário de endereço
            function limpa_formulario_cep() {
                $("#entregaEndereco, #entregaBairro, #entregaCidade, #entregaUF, #entregaCEP").val("");
            }

            // Evento para preencher os campos de endereço com dados do CEP
            $("#entregaCEP").blur(function () {
                var cep = $(this).val().replace(/\D/g, '');
                if (cep) {
                    var validacep = /^[0-9]{8}$/;
                    if (validacep.test(cep)) {
                        $("#entregaEndereco, #entregaBairro, #entregaCidade, #entregaUF").val("...");
                        $.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?", function (dados) {
                            if (!("erro" in dados)) {
                                $("#entregaEndereco").val(dados.logradouro);
                                $("#entregaBairro").val(dados.bairro);
                                $("#entregaCidade").val(dados.localidade);
                                $("#entregaUF").val(dados.uf);
                            } else {
                                limpa_formulario_cep();
                                alert("CEP não encontrado.");
                            }
                        });
                    } else {
                        limpa_formulario_cep();
                        alert("Formato de CEP inválido.");
                    }
                } else {
                    limpa_formulario_cep();
                }
            });

            // Evento do botão de pedido
            $('#botaoPedido').on('click', function () {
                const idAluguel = getIdFromURL();
                if (idAluguel) {
                    window.location.href = '/CatiProjeto/pedido.jsp?idAluguel=' + idAluguel;
                } else {
                    $('#resultado').html('<p class="text-danger">ID do aluguel não encontrado.</p>').show();
                }
            });

            // Verifica o ID do aluguel na URL
            const idAluguel = getIdFromURL();
            if (!idAluguel) {
                $('#resultado').html('<p class="text-danger">ID do aluguel não encontrado na URL.</p>').show();
                return;
            }

            // Evento para atualizar os dados do aluguel
            $('#atualizarBtn').on('click', function () {
                const dadosFormulario = {
                    idAluguel: idAluguel,
                    entregaEndereco: $('#entregaEndereco').val(),
                    entregaNumero: $('#entregaNumero').val(),
                    entregaCompl: $('#entregaCompl').val(),
                    entregaBairro: $('#entregaBairro').val(),
                    entregaCidade: $('#entregaCidade').val(),
                    entregaUF: $('#entregaUF').val(),
                    entregaCEP: $('#entregaCEP').val(),
                    entregaTelefone: $('#entregaTelefone').val(),
                    entregaRefer: $('#entregaRefer').val()
                };

                // Verifica se todos os campos obrigatórios estão preenchidos
                if (Object.values(dadosFormulario).some(value => !value)) {
                    $('#resultado').html('<p class="text-danger">Por favor, preencha todos os campos.</p>').show();
                    return;
                }

                // Requisição AJAX para atualizar o aluguel
                $.ajax({
                    url: '/CatiProjeto/alugueis',
                    method: 'PUT',
                    contentType: 'application/json',
                    data: JSON.stringify(dadosFormulario),
                    success: function (response) {
                        if (response.message) {
                            $('#resultado')
                                .removeClass('alert-danger')
                                .addClass('alert-success')
                                .html('<p><strong>' + response.message + '</strong></p>')
                                .show();
                            $('#botaoPedido').show(); // Exibe o botão de pedido após sucesso
                        } else {
                            $('#resultado')
                                .removeClass('alert-success')
                                .addClass('alert-danger')
                                .html('<p><strong>Erro!</strong> Não foi possível atualizar o endereço. Tente novamente.</p>')
                                .show();
                        }
                    },
                    error: function () {
                        $('#resultado')
                            .removeClass('alert-success alert-danger')
                            .addClass('alert-warning')
                            .html('<p><strong>Erro!</strong> Não foi possível processar a solicitação. Tente novamente.</p>')
                            .show();
                    }
                });
            });
        });
    </script>
</body>
</html>
