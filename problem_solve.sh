# substring /h8_h7_g8_i8_g6_g7_f7_e8_e6/
filename=$1
flag=$2
debug=$3
echo "input board to resolve $filename"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "I am linuX"
  export PATH=/usr/local/clang_9.0.0/bin:$PATH
  export LD_LIBRARY_PATH=/usr/local/clang_9.0.0/lib:$LD_LIBRARY_PATH
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "I am mac"
  export LIBRARY_PATH="$LIBRARY_PATH:/opt/homebrew/lib/"
else
  echo "this platform is not supported"
fi


cd gomoku


if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "I am linuX"
  clang++ -std=c++17 -stdlib=libc++ -Wall -pedantic *.cpp -o noninteractive -DCLI -DTEST -DNOINTERACTIVE -DLOADCACHE
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "I am mac"
  export LIBRARY_PATH="$LIBRARY_PATH:/opt/homebrew/lib/"
  echo $LIBRARY_PATH
  g++  *.cpp -o noninteractive -std=c++17 -DFIND_FROM_DB -DNOINTERACTIVE $flag -DCLI -DTEST `pkg-config --cflags --libs protobuf` -I/opt/homebrew/opt/rocksdb@6/include -lsnappy -lgflags -lz -lbz2 -llz4 -lzstd /opt/homebrew/opt/rocksdb@6/lib/librocksdb.a
else
  echo "this platform is not supported"
fi

cd script
python3 ./run.py $filename  >> run.py.log

