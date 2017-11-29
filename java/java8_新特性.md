java8 新特性
======

一.默认方法

    默认方法是在接口的方法签名前加上了default关键字的实现方法

例子:

    interface A {
        default void foo() {
            System.out.println("This is a default method");
        }
    }

    class ClassA implements A {
    }

    public class Test {
        public static void main(String[] args) {
            new ClassA().foo();
        }
    }

    ClassA 类并没有实现A接口中的foo 方法, InterfaceA接口中提供了foo方法的默认实现，因此可以直接调用ClassA类的foo方法