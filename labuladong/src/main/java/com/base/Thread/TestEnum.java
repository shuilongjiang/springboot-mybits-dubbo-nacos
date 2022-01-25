package com.base.Thread;

import jdk.nashorn.internal.objects.annotations.Getter;
import jdk.nashorn.internal.objects.annotations.Setter;

import java.util.Arrays;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * Description:枚举
 *
 * @author Jiang Shuilong 2022-01-21 10:54
 **/


public enum TestEnum {
    TEST_0001("t01","c01");
    private String name;
    private String code;
     TestEnum(String name, String code){
          this.name = name;
          this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    private final static Map<String ,TestEnum> map = Arrays.stream(values()).collect(Collectors.toMap(TestEnum::getCode, Function.identity()));
}
