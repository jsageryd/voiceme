# voiceme
This is an IRC bot that joins a channel and listens for the command `.voiceme`.
Upon receiving the command, it will try to voice the user in the channel it has
been joined to.

## Usage
### Run from pre-built docker image
```
docker run --rm -ti -e SERVER=irc.freenode.net -e PORT=6667 -e NICK=nickofbot -e PASS=password -e CHANNEL="#thechannel" jsageryd/voiceme
```

### Build and run in Docker
```
docker build -t voiceme .
docker run --rm -ti -e SERVER=irc.freenode.net -e PORT=6667 -e NICK=nickofbot -e PASS=password -e CHANNEL="#thechannel" voiceme
```

## License
Copyright (c) 2018 Johan Sageryd <j@1616.se>

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
