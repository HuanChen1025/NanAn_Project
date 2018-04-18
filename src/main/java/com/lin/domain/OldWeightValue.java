package com.lin.domain;

public class OldWeightValue {
    private String value;
    private String name;

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "OldWeightValue{" +
                "value='" + value + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
