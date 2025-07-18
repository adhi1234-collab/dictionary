<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.model.Word" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dictionary App</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">

        <h2>🔍 Search Word</h2>
        <form action="${pageContext.request.contextPath}/dictionary/search" method="post">
            <input type="text" name="word" placeholder="Enter word" required />
            <button type="submit">Search</button>
        </form>

        <%
            Word result = (Word) request.getAttribute("wordResult");
            Boolean notFound = (Boolean) request.getAttribute("notFound");
            if (result != null) {
        %>
            <div class="result-box">
                <p><strong>Word:</strong> <%= result.getWord() %></p>
                <p><strong>Meaning:</strong> <%= result.getMeaning() %></p>
            </div>
        <% } else if (notFound != null && notFound) { %>
            <p class="error">Word not found in the dictionary.</p>
        <% } %>

        <hr/>

        <h2>➕ Add New Word</h2>
        <form action="${pageContext.request.contextPath}/dictionary/add" method="post">
            <input type="text" name="word" placeholder="Enter word" required />
            <input type="text" name="meaning" placeholder="Enter meaning" required />
            <button type="submit">Add</button>
        </form>

        <% 
            String msg = (String) request.getAttribute("message");
            if (msg != null) {
        %>
            <p class="success"><%= msg %></p>
        <% } %>

        <hr/>

        <h2>📚 All Words in Dictionary</h2>
        <ul>
        <%
            List<Word> allWords = (List<Word>) request.getAttribute("allWords");
            if (allWords != null && !allWords.isEmpty()) {
                for (Word w : allWords) {
        %>
            <li><strong><%= w.getWord() %></strong>: <%= w.getMeaning() %></li>
        <%
                }
            } else {
        %>
            <p>No words added yet.</p>
        <%
            }
        %>
        </ul>
    </div>
</body>
</html>
