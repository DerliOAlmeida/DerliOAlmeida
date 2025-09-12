
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Cadastro Pessoa Física</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body { font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0; }
    header, footer { background-color: #003366; color: white; padding: 10px 20px; text-align: center; }
    main { padding: 20px; max-width: 800px; margin: auto; background-color: white; border-radius: 8px; }
    label { display: block; margin-top: 10px; }
    input, select { width: 100%; padding: 8px; margin-top: 5px; border: 1px solid #ccc; border-radius: 4px; }
    .celular-container { display: flex; gap: 10px; flex-wrap: wrap; }
    .celular-container div:first-child { flex: 0 0 80px; }
    .celular-container div:last-child { flex: 1; }
    button { margin-top: 20px; padding: 10px 20px; background-color: #003366; color: white; border: none; border-radius: 4px; cursor: pointer; }
    button:hover { background-color: #0055aa; }
    .hidden { display: none; }
    .message { margin-top: 15px; font-weight: bold; }

    .radio-group {
      display: flex;
      gap: 20px;
      margin-top: 5px;
      flex-wrap: wrap;
    }

    .radio-option {
      display: flex;
      align-items: center;
      gap: 5px;
      font-weight: normal;
    }

    @media (max-width: 600px) {
      .celular-container { flex-direction: column; }
      input, select, button { font-size: 16px; }
      .radio-group { flex-direction: column; }
    }
  </style>
</head>
<body>
  <header>
    <h1>Cadastro de Pessoa Física</h1>
  </header>

  <main>
    <form id="cadastroForm">
      <label>Nacionalidade:</label>
      <div class="radio-group">
        <label class="radio-option"><input type="radio" name="nacionalidade" value="Brasileiro" required> Brasileira</label><br><br>
        <label class="radio-option"><input type="radio" name="nacionalidade" value="Estrangeiro"> Estrangeiro</label><br>
      </div>

      <label for="cpf">CPF:</label>
      <input type="text" id="cpf" name="cpf" required>

      <label for="nome">Nome Completo:</label>
      <input type="text" id="nome" name="nome" required>

      <label for="mae">Nome da mãe:</label>
      <input type="text" id="mae" name="mae" required>

      <label for="genero">Gênero:</label>
      <select id="genero" name="genero" required>
        <option value="">Selecione</option>
        <option value="Masculino">Masculino</option>
        <option value="Feminino">Feminino</option>
        <option value="Outro">Outro</option>
        <option value="Prefiro não informar">Prefiro não Informar</option>
      </select>

      <div id="generoPersonalizadoDiv" class="hidden">
        <label for="generoPersonalizado">Informe seu Gênero:</label>
        <input type="text" id="generoPersonalizado" name="generoPersonalizado">
      </div>

      <label for="nascimento">Data de Nascimento:</label>
      <input type="date" id="nascimento" name="nascimento" required>

      <div class="celular-container">
        <div>
          <label for="ddd">DDD:</label>
          <input type="text" id="ddd" name="ddd" required>
        </div>
        <div>
          <label for="celular">Celular:</label>
          <input type="text" id="celular" name="celular" required>
        </div>
      </div>

      <label for="email">E-mail:</label>
      <input type="email" id="email" name="email" required>

      <label for="senha">Senha:</label>
      <input type="password" id="senha" name="senha" required>

      <label for="confirmarSenha">Confirmar senha:</label>
      <input type="password" id="confirmarSenha" name="confirmarSenha" required>

      <label>Como deseja receber o token de confirmação de cadastro:</label>
      <div class="radio-group">
        <label class="radio-option"><input type="radio" name="token" value="email" required> E-mail</label><br>
        <label class="radio-option"><input type="radio" name="token" value="celular"> Celular</label>
      </div>

      <label>
        <input type="checkbox" id="privacidade" required> Li e aceito a política de privacidade
      </label>

      <button type="submit">Cadastrar</button>
      <div id="mensagem" class="message"></div>
    </form>
  </main>

  <footer>
    <p>&copy; 2025 - Cadastro Fácil</p>
  </footer>

  <script>
    document.getElementById('genero').addEventListener('change', function() {
      const generoDiv = document.getElementById('generoPersonalizadoDiv');
      const generoInput = document.getElementById('generoPersonalizado');
      if (this.value === 'Outro') {
        generoDiv.classList.remove('hidden');
        generoInput.setAttribute('required', 'required');
      } else {
        generoDiv.classList.add('hidden');
        generoInput.removeAttribute('required');
      }
    });

    document.getElementById('cadastroForm').addEventListener('submit', function(e) {
      e.preventDefault();
      const senha = document.getElementById('senha').value;
      const confirmarSenha = document.getElementById('confirmarSenha').value;
      const mensagem = document.getElementById('mensagem');

      if (senha !== confirmarSenha) {
        mensagem.textContent = 'Erro: As senhas não coincidem.';
        mensagem.style.color = 'red';
      } else {
        mensagem.textContent = 'Registro incluído com sucesso!';
        mensagem.style.color = 'green';
      }
    });
  </script>
</body>
</html>
