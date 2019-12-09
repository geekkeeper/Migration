package com.xunsoft.webflux.handle;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.server.ServerRequest;
import org.springframework.web.reactive.function.server.ServerResponse;
import reactor.core.publisher.Mono;

/** @Author: WangXun @Date: 2019/12/5 16:48 @Description: */
@Component
public class HelloHandle {
  public Mono<ServerResponse> hello(ServerRequest request) {
    return ServerResponse.ok()
        .contentType(MediaType.APPLICATION_JSON)
        .body(BodyInserters.fromValue("Hello, This is my first Spring boot webflux project!"));
  }

  public Mono<ServerResponse> helloWorld(ServerRequest request) {
    return ServerResponse.ok()
        .contentType(MediaType.APPLICATION_JSON)
        .body(BodyInserters.fromValue("Hello World!"));
  }
}
