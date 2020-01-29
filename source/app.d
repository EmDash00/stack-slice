import std.stdio;
import mir.ndslice;
import mir.ndslice.topology;
import mir.ndslice.internal;
import std.conv;
import std.meta;

/++
   Static memory mir slice.
+/

struct StaticSlice(T, size_t[] dims)
{
    private T[dims.lengthsProduct] data;
    private bool cached = false;
    public Slice!(T*, dims.length, Contiguous) slice;


    auto get()
    {
       if (!this.cached)
       {
          slice = data[].sliced(dims);
          this.cached = true;
       }


       return(slice);
    }

    string toString()
    {

        return get.to!string;
    }

    alias get this;
}

void main()
{
   StaticSlice!(float, [3, 3]) sliceish;
   writeln(sliceish);
}
