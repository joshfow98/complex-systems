package uk.ac.edgehill;
import java.io.IOException;
import java.util.StringTokenizer;
import org.apache.hadoop.io.*;
import org.apache.hadoop.mapreduce.*;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;
import org.apache.hadoop.fs.Path;
import java.nio.ByteBuffer;

public class WordCount {
	public static class Map extends Mapper<LongWritable, Text, Text, IntWritable>{
	
		public void map(LongWritable inputKey, Text inputValue, Context context) throws IOException, InterruptedException
		{
			String inputSentence = inputValue.toString();
			StringTokenizer tokenizer = new StringTokenizer(inputSentence);
			//Remove all non-letter characters and convert to lower case before splitting on spaces.
			String[] splitString = inputSentence.replaceAll("[^a-zA-Z ]", "").toLowerCase().split("\\s+");
			for(int count = 0; count < splitString.length - 2; count++)
			{
				Text outputKey = new Text(splitString[count] + " " + splitString[count + 1] + " " + splitString[count + 2]);
				IntWritable outputValue = new IntWritable(1);
				context.write(outputKey, outputValue);
			}
		}
	}
	
	public static class Reduce extends Reducer<Text, IntWritable, Text, IntWritable>
	{
		public void reduce(Text inputKey, Iterable<IntWritable> inputListOfValues, Context context)
		throws IOException, InterruptedException
		{
			int frequencyOfCollocation = 0;
			
			for(IntWritable x: inputListOfValues)
			{
				frequencyOfCollocation += x.get();
			}
			
			Text outputKey = inputKey;
			IntWritable outputValue = new IntWritable(frequencyOfCollocation);
			context.write(outputKey, outputValue);
		}
	}
	
	public static void main(String[] args) throws Exception
	{
		Configuration conf = new Configuration();
		@SuppressWarnings("deprecation")
		Job job = new Job(conf, "mywc");
		job.setJarByClass(WordCount.class);
		job.setMapperClass(Map.class);
		job.setReducerClass(Reduce.class);
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(IntWritable.class);
		
		job.setInputFormatClass(TextInputFormat.class);
		job.setOutputFormatClass(TextOutputFormat.class);
		
		FileInputFormat.addInputPath(job, new Path(args[0]));
		FileOutputFormat.setOutputPath(job, new Path(args[1]));
		job.waitForCompletion(true);
		
		System.exit(job.waitForCompletion(true) ? 0 : 1);
	}

}
