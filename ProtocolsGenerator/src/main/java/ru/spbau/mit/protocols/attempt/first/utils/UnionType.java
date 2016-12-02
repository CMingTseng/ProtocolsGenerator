package ru.spbau.mit.protocols.attempt.first.utils;

@SuppressWarnings("unchecked")
public class UnionType<F, S> {
    private final Object item;

    public UnionType(Object item) {
        this.item = item;
    }

    public F getFirst() {
        return (F) item;
    }

    public S getSecond() {
        return (S) item;
    }
}