package com.hollysys.common;

public class Application {

    public static void main(String[] args) {

        jacobean.textToSpeech("java文字转语音播报功能的实现方法");
        int i =10;
        int aa = TagDataType.valueOf("BOOL").ordinal();
        String dataTypeName = TagDataType.values()[i].name();
        System.out.println(aa);
        System.out.println(dataTypeName);
    }
}
