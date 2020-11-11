package com.angke.k8s.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.InetAddress;
import java.net.UnknownHostException;

@RestController
public class ApiController {

    @GetMapping("/")
    public String say() throws UnknownHostException {
        String hostname = "unknown";
        InetAddress address = InetAddress.getLocalHost();
        hostname = address.getHostName();

        return hostname;
    }

}
