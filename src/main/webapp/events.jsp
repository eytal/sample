<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="uri" value="${pageContext.request.requestURI}"/>
<c:set var="url" value="${pageContext.request.requestURL}" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Events</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/events.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1>Test Server Access</h1>
        <div class="jumbotron">
            <form id="testForm">
                <p class="row">
                    <label for="apiURL" class="bold">This Server URL</label>
                    <div id="apiURL" class="api-display">

                    </div>
                </p>
                <p class="row">
                    <label for="urlInput" class="bold">Other Server Url </label>
                    <input class="form-control" type="text" id="urlInput" placeholder="Enter URL with api endpoint" required/>
                </p>
                <p class="row">
                    <label for="nonce" class="bold">Message</label>
                    <input class="form-control" type="text" id="nonce" required/>
                </p>
                <p class="row">
                    <div class="btn btn-group">
                        <button id="js_generate_nonce" class="btn btn-primary">
                            Generate Message
                        </button>
                        <button id="js_post" class="btn btn-success">
                            Post
                        </button>
                    </div>
                </p>
            </form>
        </div>
        <div class="top-right">
            <div id="js_post_toast" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="true" data-delay="1000">
                <div class="toast-header event-received">
                    <strong class="mr-auto"> MESSAGE RECEIVED </strong>
                    <button type="button" class="ml-2 mb-1 close text-light" data-dismiss="toast" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="toast-body">
                    <p>
                        <span id="js_post_message"> </span>
                    </p>
                    <p>
                        From <span id="js_post_origin"></span>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div id="js_events_parent" class="events">
        
    </div>
<script src="resources/js/jquery.js"></script>
<script src="resources/js/events.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
