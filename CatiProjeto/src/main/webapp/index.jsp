<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Equipamentos para Aluguel</title>

<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">

<style>
#equipamentos-lista div {
	border: 1px solid #ccc;
	padding: 10px;
	margin-bottom: 10px;
	background-color: #f9f9f9; . custom-indicator { background-color :
	#003366 !important;
	width: 15px;
	height: 15px;
	border-radius: 50%;
	border: none;
}

</style>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<jsp:include page="header.jsp" />

	<div id="fotoPrincipal" class="text-center my-4">
		<img src="image/tenda-piramide-com-calhas.jpg"
			alt="Tenda Pirâmide com Calhas" class="img-fluid">
	</div>

	<div class="container mt-5">
		<h1 class="mb-4">Equipamentos para Aluguel</h1>

		<div id="equipamentos-lista"></div>
	</div>

	<!-- Rodapé -->
	<footer class="footer mt-auto py-3 bg-light">
		<div class="container">
			<span class="text-muted">Equipamentos para Aluguel © 2024</span>
		</div>
	</footer>

	<script>
        $(document).ready(function() {
            // Realizar a requisição para a servlet que retorna os equipamentos em JSON
            $.ajax({
                url: 'equipamentos', // Endereço da servlet
                method: 'GET',
                dataType: 'json',
                success: function(data) {
                    // Verificar se os dados foram recebidos corretamente
                    console.log(data);

                    // Selecionar o elemento onde os equipamentos serão exibidos
                    var listaEquipamentos = $('#equipamentos-lista');
                    listaEquipamentos.empty(); // Limpar conteúdo anterior

                    // Iterar sobre os dados e adicionar as informações ao HTML com jQuery
                    $.each(data, function(index, equipamento) {
                        console.log("Índice: " + index);
                        console.log("Nome: " + equipamento.nome);
                        console.log("Preço: " + equipamento.preco);
                        console.log("Descrição: " + equipamento.descricao);

                        // Criar o HTML do equipamento com jQuery
                        var equipamentoHTML = $('<div>', { class: 'equipamento' })
                            .append($('<h3>').text(equipamento.nome))
                            .append($('<p>').html('<strong>Preço:</strong> R$ ' + equipamento.preco.toFixed(2)))
                            .append($('<p>').html('<strong>Descrição:</strong> ' + equipamento.descricao))
                        .append(
                                $('<button>', {
                                    text: 'Ver Detalhes',
                                    class: 'btn btn-info',
                                    click: function() {
                                        window.location.href = '/CatiProjeto/detalhesequipamento.jsp?id=' + equipamento.idEquipamento;
                                    }
                                })
                            );

                        // Adicionar o HTML ao elemento #equipamentos-lista
                        listaEquipamentos.append(equipamentoHTML);
                    });

                    console.log('Informações adicionadas à página.');
                },
                error: function(xhr, status, error) {
                    console.error('Erro ao carregar equipamentos: ' + error);
                }
            });
        });
    </script>

</body>
</html>
