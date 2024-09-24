<%@ page import="service.IUserService" %>
<%@ page import="service.impl.UserServiceImpl" %>
<%@ page import="dao.impl.*" %>
<%@ page import="domain.User" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulaire centré</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        input[type="text"] {
            padding: 10px;
            margin: 10px 0;
            border-radius: 4px;
            border: 1px solid #ccc;
            width: 200px;
            text-align: center;
        }

        input[type="submit"] {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .switch-container {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }

        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
        }

        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: .4s;
            border-radius: 34px;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }

        input:checked + .slider {
            background-color: #4CAF50;
        }

        input:checked + .slider:before {
            transform: translateX(26px);
        }

        .type-label {
            margin-left: 10px;
        }
        /* Split the screen in half */
        .split {
            height: 100%;
            width: 50%;
            position: fixed;
            z-index: 1;
            top: 0;
            overflow-x: hidden;
            padding-top: 20px;
        }

        /* Control the left side */
        .left {
            left: 0;
        }

        /* Control the right side */
        .right {
            right: 0;
        }

        /* If you want the content centered horizontally and vertically */
        .centered {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
        }

        /* Style the image inside the centered container, if needed */
        .centered img {
            width: 150px;
            border-radius: 50%;
        }

        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-color: #f0f0f0;
        }
        .card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            padding: 20px;
            box-sizing: border-box;
        }
        .card-title {
            font-size: 1.5em;
            margin-bottom: 15px;
            color: #333;
            text-align: center;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
        }
        .user-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .user-list li {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            display: flex;
            justify-content: space-between;
        }
        .user-list li:last-child {
            border-bottom: none;
        }
        .user-id {
            font-weight: bold;
            color: #4CAF50;
        }

        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-color: #f0f0f0;
        }
        .card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            padding: 20px;
            box-sizing: border-box;
        }
        .card-title {
            font-size: 1.5em;
            margin-bottom: 15px;
            color: #333;
            text-align: center;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
        }
        .user-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .user-list li {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            display: flex;
            justify-content: space-between;
        }
        .user-list li:last-child {
            border-bottom: none;
        }
        .user-id {
            font-weight: bold;
            color: #4CAF50;
        }
        .select-menu {
            margin-top: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .select-menu label {
            font-size: 1.2em;
            margin-bottom: 10px;
            color: #333;
        }
        .select-menu select {
            padding: 10px;
            font-size: 1em;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 100%;
            max-width: 300px;
            box-sizing: border-box;
        }
    </style>

</head>
<body>
<%
    final IUserService userService = new UserServiceImpl(
            new UserDaoImpl(),
            new QuizDaoImpl(),
            new StrawPollDaoImpl(),
            new KahootDaoImpl(),
            new QuestionTextDaoImpl(),
            new QuestionChoiceDaoImpl()
    );

    List<User> utilisateurs = userService.getAll();
%>


<div class="split left">
    <div class="centered">
        <div class="form-container">
            <form action="UserAuth" method="POST">
                <label for="username">Prénom :</label>
                <input type="text" id="username" name="username" placeholder="Entrez votre username">
                <input type="submit" value="Envoyer">
            </form>
        </div>

        <!-- Formulaire Kahoot -->
        <div class="form-container">
            <form action="#" method="POST">
                <label for="quiz-name">Nom du quiz :</label>
                <input type="text" id="quiz-name" name="quiz-name" placeholder="Nom du quiz">
                <br>
                <div class="switch-container">
                    <label class="type-label" for="quiz-type">Type :</label>
                    <label class="switch">
                        <input type="checkbox" id="quiz-type" name="quiz-type">
                        <span class="slider"></span>
                    </label>

                    <span class="type-label">Strawpoll / Quiz</span>
                </div>
                <!-- Menu déroulant -->
                <div class="select-menu">
                    <label for="user-select">Sélectionner un utilisateur :</label>
                    <select id="user-select" name="user-select">
                        <%
                            for (User user : utilisateurs) { // Remplit le menu déroulant avec les utilisateurs
                        %>
                        <option value="<%= user.getId() %>"><%= user.getUsername() %></option>
                        <%
                            }
                        %>
                    </select>
                </div>

                <input type="submit" value="Créer Quiz">
            </form>
        </div>
    </div>
</div>

<div class="split right">
    <div class="centered">
        <div class="card">
            <div class="card-title">Utilisateurs</div>
            <ul class="user-list">
                <%
                    // Appelle le service pour obtenir la liste des utilisateurs
                    for (User user : utilisateurs) { // Parcours la liste des utilisateurs
                %>
                <li>
                    <span class="user-id">ID: <%= user.getId() %></span>
                    <span>Nom: <%= user.getUsername() %></span>
                </li>
                <%
                    }
                %>
            </ul>
        </div>


    </div>
</div>
</body>
</html>
