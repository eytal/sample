package com.dsta.sampleapp.sample.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

import com.dsta.sampleapp.sample.model.Message;
import com.dsta.sampleapp.sample.service.MessageServiceImpl;
import com.dsta.sampleapp.sample.service.PostalService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;


/*
* Controller used to communicate across different services
* */

@Controller
public class ApiController {

    @Autowired
    MessageServiceImpl messageService;

    @Autowired
    PostalService postalService;

    @GetMapping("/")
    String redirectEvents(){
        return "redirect:/events";
    }
    @GetMapping(value="/status")
    String status() {
        return "Is online";
    }

    @GetMapping(value="/events")
    String events(){
        return "events";
    }
    @CrossOrigin
    @PostMapping(value="/api/post")
    ResponseEntity<String> returnNonce(@RequestBody Message received, HttpServletRequest request){

        //Message received = new Message();

        //received.setOrigin(request.getHeader("origin"));
        //received.setDestination(request.getRequestURI());
        //received.setNonce(nonce);
        System.out.println(received.toString());

        messageService.save(received);

        return new ResponseEntity<>(received.getNonce(),HttpStatus.OK);
    }
    @CrossOrigin
    @PostMapping(value="/api/send")
    ResponseEntity<String> sendMessage(@RequestBody Message to_send) {

        // Message received = new Message();

        // received.setOrigin(request.getHeader("origin"));
        // received.setDestination(request.getRequestURI());
        // received.setNonce(nonce);
        System.out.println(to_send.toString());
        try {
            HttpResponse res = postalService.post(to_send);
            System.out.println(res.toString());
        } catch (Exception e) {
            
            System.out.println(e.getMessage());
            return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_ACCEPTABLE);
        }
        
        //messageService.save(to_send);
        //If message gets sent successfully with a response
        return new ResponseEntity<>(to_send.getNonce(), HttpStatus.OK);
    }

    @GetMapping(value="/api/retrieve")
    ResponseEntity<String> retrieve(){
        Message msg = messageService.findTopByOrderByIdDesc();

        String json = "fail";
        if (msg == null){
            msg = new Message();
            msg.setValid(false);
        }

        ObjectMapper mapper = new ObjectMapper();

        try {
            json = mapper.writeValueAsString(msg);
            // System.out.println("ResultingJSONstring = " + json);
            // System.out.println(json);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(json, HttpStatus.OK);
    }

}
