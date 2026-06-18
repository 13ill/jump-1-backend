import { S3Client, PutObjectCommand } from '@aws-sdk/client-s3';

// Initialize S3 client for Cloudflare R2
const r2Client = new S3Client({
  region: 'auto',
  endpoint: process.env.R2_ENDPOINT || 'https://6fc2659450d326addf8554c4d05aa835.r2.cloudflarestorage.com',
  credentials: {
    accessKeyId: process.env.R2_ACCESS_KEY_ID || '',
    secretAccessKey: process.env.R2_SECRET_ACCESS_KEY || '',
  },
});

const BUCKET_NAME = process.env.R2_BUCKET_NAME || 'jump-1-images';
const R2_PUBLIC_URL = process.env.R2_PUBLIC_URL || 'https://pub-2d7e25b6f92840b9b82cc077b739efd8.r2.dev';

/**
 * Upload a file to Cloudflare R2
 * @param key - The key (path) for the file in R2
 * @param buffer - The file content as a Buffer
 * @param contentType - The MIME type of the file
 * @returns The public URL of the uploaded file
 */
export async function uploadToR2(key: string, buffer: Buffer, contentType: string): Promise<string> {
  try {
    console.log('📤 Uploading to R2:', { key, contentType, bucket: BUCKET_NAME });
    console.log('🔧 R2 Config:', { 
      endpoint: process.env.R2_ENDPOINT ? 'SET' : 'NOT SET',
      accessKeyId: process.env.R2_ACCESS_KEY_ID ? 'SET' : 'NOT SET',
      secretAccessKey: process.env.R2_SECRET_ACCESS_KEY ? 'SET' : 'NOT SET',
      bucketName: BUCKET_NAME,
      publicUrl: R2_PUBLIC_URL
    });

    const command = new PutObjectCommand({
      Bucket: BUCKET_NAME,
      Key: key,
      Body: buffer,
      ContentType: contentType,
    });

    await r2Client.send(command);
    console.log('✅ R2 upload successful for key:', key);
    
    // Return the public URL
    const publicUrl = `${R2_PUBLIC_URL}/${key}`;
    console.log('🔗 Returning public URL:', publicUrl);
    return publicUrl;
  } catch (error) {
    console.error('❌ Error uploading to R2:', error);
    throw new Error('Failed to upload to R2');
  }
}
