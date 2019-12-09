package com.xunsoft.webflux.router;

import com.xunsoft.webflux.handle.HelloHandle;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.web.reactive.function.server.RequestPredicates;
import org.springframework.web.reactive.function.server.RouterFunction;
import org.springframework.web.reactive.function.server.RouterFunctions;
import org.springframework.web.reactive.function.server.ServerResponse;

/** @Author: WangXun @Date: 2019/12/5 16:57 @Description: */
@Configuration
public class HelloRouter {
  @Bean
  public RouterFunction<ServerResponse> routerHello(HelloHandle handle) {
    return RouterFunctions.route(
        RequestPredicates.GET("/hello").and(RequestPredicates.accept(MediaType.APPLICATION_JSON)),
        handle::hello);
  }

  @Bean
  public RouterFunction<ServerResponse> routerHelloWorld(HelloHandle handle) {
    return RouterFunctions.route(
        RequestPredicates.GET("/helloWorld")
            .and(RequestPredicates.accept(MediaType.APPLICATION_JSON)),
        handle::helloWorld);
  }
}
