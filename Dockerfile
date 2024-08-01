# Menggunakan image Node.js versi 18 sebagai basis
FROM node:20

# Set direktori kerja di dalam container
WORKDIR /app

# Copy file package.json dan package-lock.json ke direktori kerja
COPY package*.json ./

# Install semua dependencies yang diperlukan
RUN npm install

# Copy direktori prisma dan file lainnya ke dalam container
COPY prisma ./prisma
COPY . .

# Jalankan prisma generate
RUN npx prisma generate

# Copy semua file sumber lainnya ke dalam container
COPY . .

# Buka port 3000 untuk akses aplikasi
EXPOSE 5000

# Jalankan aplikasi dalam mode production
CMD ["npm", "run", "production"]