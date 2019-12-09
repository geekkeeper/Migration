package com.xunsoft.webflux.controller;

import com.xunsoft.webflux.config.BookConfigBean;
import com.xunsoft.webflux.config.BookConfigTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/** @Author: WangXun @Date: 2019/12/6 11:04 @Description: */
@RestController
public class BookController {
  @Value("${book.name}")
  private String bookName;

  @Value("${book.author}")
  private String bookAuthor;

  @Autowired private BookConfigBean bookConfigBean;
  @Autowired private BookConfigTest configTest;

  @GetMapping("/configTest")
  public BookConfigTest configTest() {
    return configTest;
  }

  @GetMapping("/book-config")
  public BookConfigBean getBookConfigBean() {
    return bookConfigBean;
  }

  @GetMapping("/getbookinfo")
  public String getBookInfo() {
    return "书名:" + bookName + " 作者:" + bookAuthor;
  }
}
