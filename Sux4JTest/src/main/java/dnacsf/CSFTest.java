package dnacsf;

import java.io.IOException;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.io.File;
import java.io.FileReader;
import java.io.BufferedReader;
import java.nio.charset.StandardCharsets;

import it.unimi.dsi.fastutil.longs.LongArrayList;
import it.unimi.dsi.bits.TransformationStrategies;
import it.unimi.dsi.sux4j.mph.GV3CompressedFunction;

public class CSFTest
{
    public static void main( String[] args ) throws IOException, RuntimeException
    {
        if (args.length < 2) throw new RuntimeException("Too few arguments");

        ArrayList<byte[]> keys = new ArrayList<byte[]>();
        LongArrayList labels = new LongArrayList();
        File file = new File(args[0]);
        try(BufferedReader br = new BufferedReader(new FileReader(file))){
            String line;
            while((line = br.readLine()) != null){
                if(line.length() > 0) {
                    String[] vals = line.strip().split(" ");
                    if(vals.length != 2) {
                        throw new RuntimeException("Unable to split line");
                    }
                    //System.err.printf("vals[0] = %s | vals[1] = %s\n", vals[0], vals[1]);
                    keys.add(vals[0].getBytes(StandardCharsets.UTF_8));
                    labels.add(Long.parseLong(vals[1]));
                }
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        final GV3CompressedFunction.Builder<byte[]> mmfBuilder = new GV3CompressedFunction.Builder<byte[]>();
        mmfBuilder.keys(keys);
        mmfBuilder.transform(TransformationStrategies.rawByteArray());
        mmfBuilder.values(labels);
        GV3CompressedFunction<byte[]> function = mmfBuilder.build();
        function.dump(args[1]);
    }
}
