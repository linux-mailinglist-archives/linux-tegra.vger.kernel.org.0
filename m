Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1679120F2D8
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Jun 2020 12:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732514AbgF3Kkl (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 30 Jun 2020 06:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732417AbgF3Kkl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Jun 2020 06:40:41 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0791C061755
        for <linux-tegra@vger.kernel.org>; Tue, 30 Jun 2020 03:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=qvrFdWR78DdzZR/sr7/Z2l3iM62QpAfNETHsBc7eyFQ=; b=Dn3qTtNyXmYej/ItNwzIC164CT
        uDtOg7wOzD15Lv82PcFQHkzvn1Goy1Eb8K2HmiNPFX/NHKFtvK3kyHMY0vbuVLuH4FuvjO+aBPmIP
        D7HjitLpsJOLw+WfB8VC3WKl0YrQsPdhUjmfofORK1vaWhcZZ85cB7uyJyjKTkX29Fijqd9BNgLW7
        /oT2DMgN2p6PzvSdeWd8ZUewq2At0H0dVNzUULcr5iCn78n+qRfALxyEwyPQk7ZT/LAvBE6f2A9Y6
        LcH47X2dLDhInUAS2oYRRUkl6Xm7K+GlbZUV4tHoRqWjgvYmr/lkWNy2J1UByus+5WdmnPJ+Bw7Q9
        11EAdZHw==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1jqDgo-00045a-RV; Tue, 30 Jun 2020 13:40:34 +0300
Subject: Re: [RFC] Host1x/TegraDRM UAPI (drm_tegra_submit_command)
To:     Dmitry Osipenko <digetx@gmail.com>,
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
 <3f0d2e08-aa0b-9048-c22d-8f3d3106cdff@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <0faa8cf4-b002-11c1-b372-442d0af8f244@kapsi.fi>
Date:   Tue, 30 Jun 2020 13:40:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <3f0d2e08-aa0b-9048-c22d-8f3d3106cdff@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 6/29/20 3:00 AM, Dmitry Osipenko wrote:
> 28.06.2020 13:28, Mikko Perttunen пишет:
>> On 6/28/20 1:32 AM, Dmitry Osipenko wrote:
>>> 23.06.2020 15:09, Mikko Perttunen пишет:
>>>> /* Command is an opcode gather from a GEM handle */
>>>> #define DRM_TEGRA_SUBMIT_COMMAND_GATHER             0
>>>> /* Command is an opcode gather from a user pointer */
>>>> #define DRM_TEGRA_SUBMIT_COMMAND_GATHER_UPTR        1
>>>> /* Command is a wait for syncpt fence completion */
>>>> #define DRM_TEGRA_SUBMIT_COMMAND_WAIT_SYNCPT        2
>>>> /* Command is a wait for SYNC_FILE FD completion */
>>>> #define DRM_TEGRA_SUBMIT_COMMAND_WAIT_SYNC_FILE     3
>>>> /* Command is a wait for DRM syncobj completion */
>>>> #define DRM_TEGRA_SUBMIT_COMMAND_WAIT_SYNCOBJ       4
>>>>
>>>> /*
>>>>    * Allow driver to skip command execution if engine
>>>>    * was not accessed by another channel between
>>>>    * submissions.
>>>>    */
>>>> #define DRM_TEGRA_SUBMIT_CONTEXT_SETUP                        (1<<0)
>>>>
>>>> struct drm_tegra_submit_command {
>>>>           __u16 type;
>>>>           __u16 flags;
>>>
>>> Shouldn't the "packed" attribute be needed if a non-32bit aligned fields
>>> are used?
>>
>> I guess we should change these to u32 for consistency.
>>
>>>
>>>>           union {
>>>>                   struct {
>>>>                       /* GEM handle */
>>>>                       __u32 handle;
>>>>
>>>>                       /*
>>>>                        * Offset into GEM object in bytes.
>>>>                        * Must be aligned by 4.
>>>>                        */
>>>>                       __u64 offset;
>>>
>>> 64bits for a gather offset is a bit too much, in most cases gathers are
>>> under 4K.
>>>
>>> u32 should be more than enough (maybe even u16 if offset is given in a
>>> dword granularity).
>>
>> I guess this can be changed to u32, though I don't think there is any
>> particularly pressing reason not to use u64.
>>
>> In any case, I think we concluded that we'll drop the GEM gather command
>> for now.
> 
> Sure, I commented this just in a case, for the future :)

Yep, OK :)

> 
>>>
>>>>                       /*
>>>>                        * Length of gather in bytes.
>>>>                        * Must be aligned by 4.
>>>>                        */
>>>>                       __u64 length;
>>>
>>> u32/16
>>>
>>>>                   } gather;
>>>
>>>>                   struct {
>>>>                           __u32 reserved[1];
>>>>
>>>>                           /*
>>>>                            * Pointer to gather data.
>>>>                            * Must be aligned by 4 bytes.
>>>>                            */
>>>>                           __u64 base;
>>>>                           /*
>>>>                            * Length of gather in bytes.
>>>>                            * Must be aligned by 4.
>>>>                            */
>>>>                           __u64 length;
>>>>                   } gather_uptr;
>>>
>>> What about to inline the UPTR gather data and relocs into the
>>> drm_tegra_submit_command[] buffer:
>>>
>>> struct drm_tegra_submit_command {
>>>      struct {
>>>          u16 num_words;
>>>          u16 num_relocs;
>>>
>>>          gather_data[];
>>>          drm_tegra_submit_relocation relocs[];
>>>      } gather_uptr;
>>> };
>>>
>>> struct drm_tegra_channel_submit {
>>>           __u32 num_syncpt_incrs;
>>>           __u32 syncpt_idx;
>>>
>>>           __u64 commands_ptr;
>>>      __u32 commands_size;
>>> ...
>>> };
>>>
>>> struct drm_tegra_submit_command example[] = {
>>>      cmd.gather_uptr{},
>>>      ...
>>>      gather_data[],
>>>      gather_relocs[],
>>>      cmd.wait_syncpt{},
>>>      ...
>>> };
>>>
>>> This way we will have only a single copy_from_user() for the whole
>>> cmdstream, which should be more efficient to do and nicer from both
>>> userspace and kernel perspectives in regards to forming and parsing the
>>> commands.
>>>
>>
>> I'm not sure I agree it being nicer with regard to forming and parsing
>> - Can you actually place multiple unsized arrays in a struct without
>> pointers?
> 
> No :) But there are no unsized arrays here. The parser will read first
> command and then move pointer to the next command based on size of the
> parsed command.
> 
>> - gather_data's length is a multiple of 4, and so since we have u64's in
>> drm_tegra_submit_relocation, alignment needs to be taken care of
>> manually, both when forming and kernel needs to validate it while
>> parsing. Depending on number of words in the gather, padding would need
>> to be inserted. We could swap the two around but it still feels more
>> brittle.
> 
> Yes, there will be unaligned reads on ARM64, but I don't think it's a
> problem. Isn't it?

It's not a big problem, but I think it would be less error-prone to have 
naturally aligned data.

> 
>> Also, if we read the gather from a separate address, userspace doesn't
>> necessarily need to know the length of the gather (and number of relocs)
>> upfront, so it's easier to have a builder pattern without needing to
>> copy things later.
> 
> Usually there are 2-3 relocs per gather, so userspace could simply
> maintain a fixed-sized static buffer for the relocs (say 32 relocs).
> Once gather is sliced by userspace, the stashed relocs will be appended
> to the comands buffer and next gather will be formed.
> 
> The relocs copying doesn't really costs anything for userspace, the
> price is incomparable with the cost of UPTR copying of each gather for
> the kernel.
> 
> Well, the UPTR copying isn't expensive, but if there is a single copy
> for the whole IOCTL, then it's even much better!
> 
>> If we allow direct page mappings for gathers later, a separate address
>> would make things also a little bit easier. For direct page mappings
>> userspace would need to keep the opcode data unchanged while the job is
>> being executed, so userspace could keep an arena where the gathers are
>> placed, and refer to segments of that, instead of having to keep the
>> drm_tegra_submit_commands alive.
> 
> Okay, what about to have a single UPTR buffer for all gathers of a job?
> 
> struct drm_tegra_channel_submit {
> 	u64 commands_ptr;
> 	u64 gathers_ptr;
> 
> 	u32 commands_size;
> 	u32 gathers_size;
> 	...
> };
> 
> struct drm_tegra_submit_command {
> 	...
>          union {
>                  struct {
>                          /*
>                           * Length of gather in bytes.
>                           * Must be aligned by 4.
>                           */
>                          __u32 length;
>                  } gather_uptr;
> 	};
> };
> 
> Now we have a single UPTR gather that could be sliced into sub-gathers
> during of job's submission and also the whole data could be copied at
> once by kernel driver for the parsing purposes.
> 
> The userspace will have to preallocate a large-enough buffer upfront for
> the gathers. If it runs out of space in the buffer, then it should
> reallocate a larger buffer. Nice and simple :)
> 

I think that would work fine for the usecases that I can think of.

Mikko
