Return-Path: <linux-tegra+bounces-8724-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9130FB35762
	for <lists+linux-tegra@lfdr.de>; Tue, 26 Aug 2025 10:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B36A3A84D0
	for <lists+linux-tegra@lfdr.de>; Tue, 26 Aug 2025 08:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C67A2FC01D;
	Tue, 26 Aug 2025 08:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kDw3wYbe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Yu37ES0A";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kDw3wYbe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Yu37ES0A"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB182FC864
	for <linux-tegra@vger.kernel.org>; Tue, 26 Aug 2025 08:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756197610; cv=none; b=O4GVbtqljwigui6Gtnrw0AjxAEpZ0iviNp3a4+yOHiKZmbeEELm8DHUKTD1waYEKQpPcFJJ6AFRKyc/lR56IxnekYH5SlOOOGtfOHB0iHCnfn1q5hrsz8xMbhxL5CoMFlorvsp1Fc37cTjDtpk7WIS47kmBlU6FDIido2Y2UXfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756197610; c=relaxed/simple;
	bh=SAhgehn1xkBiAlohhWgbz8Fw/0Offz5/q7WwEU+n/x0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=gTEQqwCS06JAwH9HVb7pM48D8C4mZFN3PWfSoQf51iuwfE+L8RG6wVUH+hYOUE9Jfka31E6N+Yc4U0mJCCTkymRcvhKyaWb9cbOY8206/mcbX1WrBJJgQn2l4FTP2+Y/DkHasBtVSWOI7Ijodkfc0NmIHH9fMJaVEL3Hqq6N+As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kDw3wYbe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Yu37ES0A; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kDw3wYbe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Yu37ES0A; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A55C51F788;
	Tue, 26 Aug 2025 08:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756197606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4RqrLgyjtLr765XMrabTSWAqV8H+gZSjxgO6mleW1H8=;
	b=kDw3wYbeVn13f8wudlSx0hyUKUe/7x4ZjKHYAnWm1GncT7vKVMlhHk2i8IFciQFC8lpe13
	99U/77iQN1DRyM2Q/pGmaE92m4GTMI/IFF3MV+ZP2nJWOkYw1lSO07FgE8q6MwHPrXDOvH
	dbQGVWmsN86YlRm08YdD+Y+fkuSODzc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756197606;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4RqrLgyjtLr765XMrabTSWAqV8H+gZSjxgO6mleW1H8=;
	b=Yu37ES0ARFyTw9IwrsoOd6FFkVrKuoXuKGAe+IiSKzWsp4Hno3ozrOKbLP/q7a6T/v7wUN
	ouAiJas9mPZrhDDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756197606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4RqrLgyjtLr765XMrabTSWAqV8H+gZSjxgO6mleW1H8=;
	b=kDw3wYbeVn13f8wudlSx0hyUKUe/7x4ZjKHYAnWm1GncT7vKVMlhHk2i8IFciQFC8lpe13
	99U/77iQN1DRyM2Q/pGmaE92m4GTMI/IFF3MV+ZP2nJWOkYw1lSO07FgE8q6MwHPrXDOvH
	dbQGVWmsN86YlRm08YdD+Y+fkuSODzc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756197606;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4RqrLgyjtLr765XMrabTSWAqV8H+gZSjxgO6mleW1H8=;
	b=Yu37ES0ARFyTw9IwrsoOd6FFkVrKuoXuKGAe+IiSKzWsp4Hno3ozrOKbLP/q7a6T/v7wUN
	ouAiJas9mPZrhDDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E01A13A31;
	Tue, 26 Aug 2025 08:40:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nNMyGeZyrWikUQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 26 Aug 2025 08:40:06 +0000
Message-ID: <c18a0cdd-358a-4678-a77a-1a34e8983e4f@suse.de>
Date: Tue, 26 Aug 2025 10:40:06 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/tegra: Use dma_buf from GEM object instance"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
 simona@ffwll.ch, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250715084549.41473-1-tzimmermann@suse.de>
 <23ddfdef-47a8-4ba4-a2b2-3e0c73aba6bf@suse.de>
Content-Language: en-US
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <23ddfdef-47a8-4ba4-a2b2-3e0c73aba6bf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch];
	TAGGED_RCPT(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Hi

Am 12.08.25 um 11:12 schrieb Thomas Zimmermann:
> Hi Thierry,
>
> can I take this patch into drm-misc-fixes?

I'm merging this patch into drm-misc-fixes to get the upstream bug fixed.

Best regards
Thomas

>
> Best regards
> Thomas
>
> Am 15.07.25 um 10:45 schrieb Thomas Zimmermann:
>> This reverts commit 482c7e296edc0f594e8869a789a40be53c49bd6a.
>>
>> The dma_buf field in struct drm_gem_object is not stable over the
>> object instance's lifetime. The field becomes NULL when user space
>> releases the final GEM handle on the buffer object. This resulted
>> in a NULL-pointer deref.
>>
>> Workarounds in commit 5307dce878d4 ("drm/gem: Acquire references on
>> GEM handles for framebuffers") and commit f6bfc9afc751 
>> ("drm/framebuffer:
>> Acquire internal references on GEM handles") only solved the problem
>> partially. They especially don't work for buffer objects without a DRM
>> framebuffer associated.
>>
>> Hence, this revert to going back to using .import_attach->dmabuf.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/tegra/gem.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
>> index 41a285ec889f..8ede07fb7a21 100644
>> --- a/drivers/gpu/drm/tegra/gem.c
>> +++ b/drivers/gpu/drm/tegra/gem.c
>> @@ -526,7 +526,7 @@ void tegra_bo_free_object(struct drm_gem_object 
>> *gem)
>>           if (drm_gem_is_imported(gem)) {
>> dma_buf_unmap_attachment_unlocked(gem->import_attach, bo->sgt,
>>                                 DMA_TO_DEVICE);
>> -            dma_buf_detach(gem->dma_buf, gem->import_attach);
>> +            dma_buf_detach(gem->import_attach->dmabuf, 
>> gem->import_attach);
>>           }
>>       }
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)



