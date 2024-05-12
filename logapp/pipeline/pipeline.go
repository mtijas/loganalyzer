package pipeline

import "fmt"

type Pipe interface {
	Process(in chan int) chan int
}

type Pipeline struct {
	head chan int
	tail chan int
}

func CreatePipeline(pipes ...Pipe) Pipeline {
	head := make(chan int)
	var tail chan int

	for _, pipe := range pipes {
		if tail == nil {
			tail = pipe.Process(head)
		} else {
			tail = pipe.Process(tail)
		}
	}
	return Pipeline{head: head, tail: tail}
}

func (p *Pipeline) Enqueue(item int) {
	fmt.Printf("Enqueueing: %v\n", item)
	p.head <- item
}

func (p *Pipeline) Dequeue(handler func(int)) {
	for i := range p.tail {
		handler(i)
	}
}

func (p *Pipeline) Close() {
	close(p.head)
}
