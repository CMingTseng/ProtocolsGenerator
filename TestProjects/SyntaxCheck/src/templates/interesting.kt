package templates.interesting


protocol interface PT<T> {
    fun x(t: T): T
}

class A

class X {
    fun x() {}
    fun x(i: Int) = i
    fun x(i: Int?) = i!! * 2
}

fun main(args: Array<String>) {

//    val obj2: PT<Int?> = X()
//    if (obj2.x(42) != 84) {
//        println("Fail")
//    }

    val obj: PT<Int> = X()
    println(obj.x(42))

//    if (obj.x(42) != 42) {
//        println("Fail")
//    }
}