<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <c:set var="uri" value="${pageContext.request.requestURI}" />
            <c:set var="url" value="${pageContext.request.requestURL}" />

            <%@ page contentType="text/html;charset=UTF-8" language="java" %>
                <html>

                <head>
                    <title> Events</title>
                    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
                    <link href="resources/css/events.css" rel="stylesheet">
                </head>

                <body>
                    <div class="clearfix">
                        <div class="half-left">
                            <div class="row h-100">
                                <div class="col-sm-10 my-auto mx-auto">
                                    <div class="card bg-dark">
                                        <div class="card-header text-white">
                                            <h1>Server Messenger</h1>
                                        </div>
                                        <div class="card-body text-white">
                                            <h5 class="card-title">Instructions</h5>
                                            <p class="card-text">
                                                Enter the address of another Server Messenger to send a message to. The Message Window will display the status of messages sent and received on the right.
                                            </p>
                                        </div>
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item bg-secondary">
                                                <input class="form-control" type="text" id="urlInput" placeholder="Receiver Address" required/>
                                            </li>
                                            <li class="list-group-item bg-secondary">
                                                <input class="form-control" type="text" id="nonce" placeholder="Message" required/>
                                            </li>
                                            <li class="list-group-item bg-secondary">
                                                <div class="btn btn-group">
                                                    <button id="js_generate_nonce" class="btn btn-primary">
                                                                            Randomize Message
                                                                        </button>
                                                    <button id="js_post" class="btn btn-success">
                                                                                Send
                                                                        </button>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="half-right">
                            <div class="row h-100">
                                <div class="col-sm-10 my-auto mx-auto">
                                    <div id="js_events_parent" class="events-window"></div>
                                </div>
                            </div>
                        </div>

                        <div id="js_post_toast" class="toast top-right" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="true" data-delay="1000">
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


                    <script src="resources/js/jquery.js"></script>
                    <script src="resources/js/events.js"></script>
                    <script src="resources/js/bootstrap.min.js"></script>
                </body>

                </html>