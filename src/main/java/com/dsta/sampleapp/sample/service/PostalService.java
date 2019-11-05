package com.dsta.sampleapp.sample.service;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.stereotype.Service;

import java.io.IOException;

import com.dsta.sampleapp.sample.model.Message;
import com.google.gson.Gson;

@Service
public class PostalService {

    public HttpResponse post(Message message) throws ClientProtocolException, IOException {
        String postUrl = message.getDestination() + "/api/post";// put in your url
        Gson gson = new Gson();
        HttpClient httpClient = HttpClientBuilder.create().build();
        HttpPost post = new HttpPost(postUrl);
        StringEntity postingString = new StringEntity(gson.toJson(message));// gson.tojson() converts your pojo to json
        post.setEntity(postingString);
        post.setHeader("Content-type", "application/json");
        HttpResponse response = httpClient.execute(post);
        return response;
   }

}