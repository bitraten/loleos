void init(void)
{
	const char hw[] = "Hello World!";
	int i;
	char* video = (char*) 0xb8000;

	for(video+=4000; video !=(char*)0xb8000; video--)
		*video=0;

	for (i = 0; hw[i] != '\0'; i++) {

		video[i*2] = hw[i];

		// 0x07 = Hellgrau auf Schwarz
		video[i * 2 + 1] = 0x07;
	}
}
