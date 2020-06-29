Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA5220CB23
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jun 2020 02:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbgF2AAK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 28 Jun 2020 20:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726350AbgF2AAJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Jun 2020 20:00:09 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46DE9C03E979
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2020 17:00:09 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id f5so181992ljj.10
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2020 17:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qAx5VBPEoxfFFPCSdYQxL6J6HVE4Hnow+vGJgzv15sY=;
        b=FmAQHIEfgtywOIBM/e66H03h9Bdrd6+WwTxtAH1TnMFfBkZS6KHycOcTuBMR4HWpq0
         1z5z1C1CEwrKCMMYDrOux8ESdlODUaNw/ZNm3O4iIG3UdOnl0qNZuUgV9hvC+vzgODAt
         edbtlZXQoL30MkfbWBLSIiBmKHO2pNJa1sUURUw02J47Bgo7jryLWMikH/fuMScKEeBl
         k6/Q3usSgWM58pR77AeEtoMJZ0EO9sEPjDBKGG3leaWx6w/Y31+2nAZMmRWsBj1kIzfS
         32InlqwRHpKcTwbQHfVIYO7vW1nZW5nIteyVMaH/DvLh5waLvHVKyVmIhqPDfC/P+wTZ
         WTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qAx5VBPEoxfFFPCSdYQxL6J6HVE4Hnow+vGJgzv15sY=;
        b=lL9QMijBiqQ97Eb6sMi2ivD4ehACKCdW1NjDpY92NX6sdxpFik/uGZZFbrdd1YYw7Y
         jA53hnCbdwwdJdV6twK3XN7wP74r4QNXb1y0Yme4H6C6MdQey0VufjzurrS+7S8GUQDJ
         lZMaUyyVgadppUM9I4sd8VeAzDMZYFue/zDPSUkxlBXc0MVdS2fhoFKHCiRVnhb83MIi
         o1fI/iAYCadvuYjeDrnZs2Yb2ByYxyN4NjnBNzWLoZgXDwr2DHTYD2njtq08d6KXnV6d
         BmorAI1PW+M3FYXAFa7UQcxbjx1DgB2rRi9lN7gYK76+uZRBDYybNoARupDdiqc0WlGg
         iCMA==
X-Gm-Message-State: AOAM530CAITX/3ZUCTQDlmar01s53s94en4WQaQI1SGaNhp/N5pNTLYA
        jIuVmTurXAXWx+ihKyFoDu0=
X-Google-Smtp-Source: ABdhPJySmIlHXzYAwVEeD+3MpSFOk/QoIfClC/+Bvn+1toqG2cWU2FqnlmB6N2IyvkoRDvpukx73rQ==
X-Received: by 2002:a2e:9dd8:: with SMTP id x24mr7130504ljj.304.1593388807666;
        Sun, 28 Jun 2020 17:00:07 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id n3sm1573659ljc.114.2020.06.28.17.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2020 17:00:06 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI (drm_tegra_submit_command)
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        gustavo@padovan.org
Cc:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>, talho@nvidia.com,
        bhuntsman@nvidia.com, Erik Faye-Lund <kusmabite@gmail.com>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <f31fbe3b-3fc5-2ece-4c2c-9ff4e99995d6@gmail.com>
 <19b7b295-30fa-8897-02f3-3c3b8f2a0e53@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3f0d2e08-aa0b-9048-c22d-8f3d3106cdff@gmail.com>
Date:   Mon, 29 Jun 2020 03:00:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <19b7b295-30fa-8897-02f3-3c3b8f2a0e53@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

28.06.2020 13:28, Mikko Perttunen пишет:
> On 6/28/20 1:32 AM, Dmitry Osipenko wrote:
>> 23.06.2020 15:09, Mikko Perttunen пишет:
>>> /* Command is an opcode gather from a GEM handle */
>>> #define DRM_TEGRA_SUBMIT_COMMAND_GATHER             0
>>> /* Command is an opcode gather from a user pointer */
>>> #define DRM_TEGRA_SUBMIT_COMMAND_GATHER_UPTR        1
>>> /* Command is a wait for syncpt fence completion */
>>> #define DRM_TEGRA_SUBMIT_COMMAND_WAIT_SYNCPT        2
>>> /* Command is a wait for SYNC_FILE FD completion */
>>> #define DRM_TEGRA_SUBMIT_COMMAND_WAIT_SYNC_FILE     3
>>> /* Command is a wait for DRM syncobj completion */
>>> #define DRM_TEGRA_SUBMIT_COMMAND_WAIT_SYNCOBJ       4
>>>
>>> /*
>>>   * Allow driver to skip command execution if engine
>>>   * was not accessed by another channel between
>>>   * submissions.
>>>   */
>>> #define DRM_TEGRA_SUBMIT_CONTEXT_SETUP                        (1<<0)
>>>
>>> struct drm_tegra_submit_command {
>>>          __u16 type;
>>>          __u16 flags;
>>
>> Shouldn't the "packed" attribute be needed if a non-32bit aligned fields
>> are used?
> 
> I guess we should change these to u32 for consistency.
> 
>>
>>>          union {
>>>                  struct {
>>>                      /* GEM handle */
>>>                      __u32 handle;
>>>
>>>                      /*
>>>                       * Offset into GEM object in bytes.
>>>                       * Must be aligned by 4.
>>>                       */
>>>                      __u64 offset;
>>
>> 64bits for a gather offset is a bit too much, in most cases gathers are
>> under 4K.
>>
>> u32 should be more than enough (maybe even u16 if offset is given in a
>> dword granularity).
> 
> I guess this can be changed to u32, though I don't think there is any
> particularly pressing reason not to use u64.
> 
> In any case, I think we concluded that we'll drop the GEM gather command
> for now.

Sure, I commented this just in a case, for the future :)

>>
>>>                      /*
>>>                       * Length of gather in bytes.
>>>                       * Must be aligned by 4.
>>>                       */
>>>                      __u64 length;
>>
>> u32/16
>>
>>>                  } gather;
>>
>>>                  struct {
>>>                          __u32 reserved[1];
>>>
>>>                          /*
>>>                           * Pointer to gather data.
>>>                           * Must be aligned by 4 bytes.
>>>                           */
>>>                          __u64 base;
>>>                          /*
>>>                           * Length of gather in bytes.
>>>                           * Must be aligned by 4.
>>>                           */
>>>                          __u64 length;
>>>                  } gather_uptr;
>>
>> What about to inline the UPTR gather data and relocs into the
>> drm_tegra_submit_command[] buffer:
>>
>> struct drm_tegra_submit_command {
>>     struct {
>>         u16 num_words;
>>         u16 num_relocs;
>>
>>         gather_data[];
>>         drm_tegra_submit_relocation relocs[];
>>     } gather_uptr;
>> };
>>
>> struct drm_tegra_channel_submit {
>>          __u32 num_syncpt_incrs;
>>          __u32 syncpt_idx;
>>
>>          __u64 commands_ptr;
>>     __u32 commands_size;
>> ...
>> };
>>
>> struct drm_tegra_submit_command example[] = {
>>     cmd.gather_uptr{},
>>     ...
>>     gather_data[],
>>     gather_relocs[],
>>     cmd.wait_syncpt{},
>>     ...
>> };
>>
>> This way we will have only a single copy_from_user() for the whole
>> cmdstream, which should be more efficient to do and nicer from both
>> userspace and kernel perspectives in regards to forming and parsing the
>> commands.
>>
> 
> I'm not sure I agree it being nicer with regard to forming and parsing
> - Can you actually place multiple unsized arrays in a struct without
> pointers?

No :) But there are no unsized arrays here. The parser will read first
command and then move pointer to the next command based on size of the
parsed command.

> - gather_data's length is a multiple of 4, and so since we have u64's in
> drm_tegra_submit_relocation, alignment needs to be taken care of
> manually, both when forming and kernel needs to validate it while
> parsing. Depending on number of words in the gather, padding would need
> to be inserted. We could swap the two around but it still feels more
> brittle.

Yes, there will be unaligned reads on ARM64, but I don't think it's a
problem. Isn't it?

> Also, if we read the gather from a separate address, userspace doesn't
> necessarily need to know the length of the gather (and number of relocs)
> upfront, so it's easier to have a builder pattern without needing to
> copy things later.

Usually there are 2-3 relocs per gather, so userspace could simply
maintain a fixed-sized static buffer for the relocs (say 32 relocs).
Once gather is sliced by userspace, the stashed relocs will be appended
to the comands buffer and next gather will be formed.

The relocs copying doesn't really costs anything for userspace, the
price is incomparable with the cost of UPTR copying of each gather for
the kernel.

Well, the UPTR copying isn't expensive, but if there is a single copy
for the whole IOCTL, then it's even much better!

> If we allow direct page mappings for gathers later, a separate address
> would make things also a little bit easier. For direct page mappings
> userspace would need to keep the opcode data unchanged while the job is
> being executed, so userspace could keep an arena where the gathers are
> placed, and refer to segments of that, instead of having to keep the
> drm_tegra_submit_commands alive.

Okay, what about to have a single UPTR buffer for all gathers of a job?

struct drm_tegra_channel_submit {
	u64 commands_ptr;
	u64 gathers_ptr;

	u32 commands_size;
	u32 gathers_size;
	...
};

struct drm_tegra_submit_command {
	...
        union {
                struct {
                        /*
                         * Length of gather in bytes.
                         * Must be aligned by 4.
                         */
                        __u32 length;
                } gather_uptr;
	};
};

Now we have a single UPTR gather that could be sliced into sub-gathers
during of job's submission and also the whole data could be copied at
once by kernel driver for the parsing purposes.

The userspace will have to preallocate a large-enough buffer upfront for
the gathers. If it runs out of space in the buffer, then it should
reallocate a larger buffer. Nice and simple :)
