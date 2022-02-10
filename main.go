package main

import (
	"io/ioutil"
	"fmt"
	"time"
	"log"
	"os"
)

const (
	WAIT_SEC = 1
)

func main() {
	fmt.Println("Test.")
	for ;; {
		// _, err := ioutil.ReadDir("/workspace/source")
		// if err != nil {
		// 	log.Fatal("failed to read folder... Cause: " + err.Error())
		// }

		fmt.Println("Create temp folder!")
		dir, err := ioutil.TempDir("/workspace/source", "test")
		if err != nil {
			log.Fatal(err)
		}

		fmt.Println("Create file!")
		if _, err = os.OpenFile(dir + "/" + "testFile.txt", os.O_RDONLY|os.O_CREATE, 0777); err != nil {
			log.Fatal("Unable to create and open file!")
		}

		fmt.Println("Remove temp directory!")
		if err := os.RemoveAll(dir); err != nil {
			log.Fatal("Failed to remove folder " + dir + err.Error())
		}

		time.Sleep(WAIT_SEC * time.Second)
	}
}
