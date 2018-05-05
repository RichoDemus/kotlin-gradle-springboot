package com.example.demo

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.bind.annotation.RestController


@SpringBootApplication
@RestController
class DemoApplication {
    @GetMapping(path = ["/hello"], produces = ["application/json; charset=UTF-8"])
    @ResponseBody
    fun sayHello() = Response("Hello, backend here!")
}

data class Response(val msg: String)

fun main(args: Array<String>) {
    runApplication<DemoApplication>(*args)
}
