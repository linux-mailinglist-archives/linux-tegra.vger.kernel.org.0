Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A72820C4B5
	for <lists+linux-tegra@lfdr.de>; Sun, 28 Jun 2020 00:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbgF0WcE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 27 Jun 2020 18:32:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgF0WcE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Jun 2020 18:32:04 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1FAAC061794
        for <linux-tegra@vger.kernel.org>; Sat, 27 Jun 2020 15:32:03 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id c11so7000272lfh.8
        for <linux-tegra@vger.kernel.org>; Sat, 27 Jun 2020 15:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KI0QLmVCjjTMq/liju5LuAbZSO1DU/M8HGIKzvnZfZA=;
        b=AqdsbRdrumFb5omQ54zZ/ZMuSu6PWS1wyma5Kowy/H7iXUYC5t+Yn4WkAgSfDWQfaK
         VyAfCFBZQDixCaa/rflKPaOPO2g8l/XtH9PXE7AZZjJVAKosoGNrWnf3B4u+KucbrK/y
         4cpo9eEkdcsebW2CC63QFf4xjFlJPkm7s7JGXTMCeDlcwUb46z9kvMro+sbbQZKUgzRu
         qblWJ8HtWJffT8GKNt16HDQ+5qECUVGoyWMgGXEBfizcpL1sRqzZUgGeQm13mZTR6luq
         HvtZJ++THOWm1vBHVkdknhrW+NomNXNtYLS5gR5buIqhHH3OF8qehZWg48IeuLPjL2mM
         wbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KI0QLmVCjjTMq/liju5LuAbZSO1DU/M8HGIKzvnZfZA=;
        b=YLkuZzYlQZbGe7btvHFwhPJWf6ins0Mjc39UYkheKdcSrhF/82e0foFfxA5th7Xo9f
         DvTRAOfjO0DkSvn0b/9HtTgwI4pzibMzCj+cJTpyB1RqDVPn3tBpdlOwGN14cpsFSdP6
         nPHh2ikIPZnhYvwRW89DIS8jJ2rdblfegm/7PQxcwHYJ4E9KFdaO2i1mI2n/JfjPZ3xL
         8oTqg3A4rcMEDIdL8bl2VAInAp6G0QN8XoyF9SAk+elIJYOiSIbE+YwxjcV4oSyPDaAf
         BjIJbXPtVDYrfX7e2+M8iUHNepPS/m9OtjOHVg24rVjJNy9CjT7iyg+fCQs2DpAsNkYL
         4u2w==
X-Gm-Message-State: AOAM533qVYCg8A3zJ7T6yWt+c3s1IQ565vMR27vUlS2YdEbDCfXES5ff
        stOG1FhRSGSSa8VrQe0oECM=
X-Google-Smtp-Source: ABdhPJwptYMmsgc+XFwI8cVVRMC/GMyQh++1AuGgHnkvFWOM8oeAqqgisonrCpYywqUd+dbSmj/wSg==
X-Received: by 2002:a05:6512:4c6:: with SMTP id w6mr3250609lfq.76.1593297122246;
        Sat, 27 Jun 2020 15:32:02 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id z84sm6078108lfa.54.2020.06.27.15.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2020 15:32:01 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI (drm_tegra_submit_command)
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        gustavo@padovan.org
Cc:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>, talho@nvidia.com,
        bhuntsman@nvidia.com
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f31fbe3b-3fc5-2ece-4c2c-9ff4e99995d6@gmail.com>
Date:   Sun, 28 Jun 2020 01:32:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.06.2020 15:09, Mikko Perttunen пишет:
> /* Command is an opcode gather from a GEM handle */
> #define DRM_TEGRA_SUBMIT_COMMAND_GATHER             0
> /* Command is an opcode gather from a user pointer */
> #define DRM_TEGRA_SUBMIT_COMMAND_GATHER_UPTR        1
> /* Command is a wait for syncpt fence completion */
> #define DRM_TEGRA_SUBMIT_COMMAND_WAIT_SYNCPT        2
> /* Command is a wait for SYNC_FILE FD completion */
> #define DRM_TEGRA_SUBMIT_COMMAND_WAIT_SYNC_FILE     3
> /* Command is a wait for DRM syncobj completion */
> #define DRM_TEGRA_SUBMIT_COMMAND_WAIT_SYNCOBJ       4
> 
> /*
>  * Allow driver to skip command execution if engine
>  * was not accessed by another channel between
>  * submissions.
>  */
> #define DRM_TEGRA_SUBMIT_CONTEXT_SETUP                        (1<<0)
> 
> struct drm_tegra_submit_command {
>         __u16 type;
>         __u16 flags;

Shouldn't the "packed" attribute be needed if a non-32bit aligned fields
are used?

>         union {
>                 struct {
>                     /* GEM handle */
>                     __u32 handle;
> 
>                     /*
>                      * Offset into GEM object in bytes.
>                      * Must be aligned by 4.
>                      */
>                     __u64 offset;

64bits for a gather offset is a bit too much, in most cases gathers are
under 4K.

u32 should be more than enough (maybe even u16 if offset is given in a
dword granularity).

>                     /*
>                      * Length of gather in bytes.
>                      * Must be aligned by 4.
>                      */
>                     __u64 length;

u32/16

>                 } gather;

>                 struct {
>                         __u32 reserved[1];
> 
>                         /*
>                          * Pointer to gather data.
>                          * Must be aligned by 4 bytes.
>                          */
>                         __u64 base;
>                         /*
>                          * Length of gather in bytes.
>                          * Must be aligned by 4.
>                          */
>                         __u64 length;
>                 } gather_uptr;

What about to inline the UPTR gather data and relocs into the
drm_tegra_submit_command[] buffer:

struct drm_tegra_submit_command {
	struct {
		u16 num_words;
		u16 num_relocs;

		gather_data[];
		drm_tegra_submit_relocation relocs[];
	} gather_uptr;
};

struct drm_tegra_channel_submit {
        __u32 num_syncpt_incrs;
        __u32 syncpt_idx;

        __u64 commands_ptr;
	__u32 commands_size;
...
};

struct drm_tegra_submit_command example[] = {
	cmd.gather_uptr{},
	...
	gather_data[],
	gather_relocs[],
	cmd.wait_syncpt{},
	...
};

This way we will have only a single copy_from_user() for the whole
cmdstream, which should be more efficient to do and nicer from both
userspace and kernel perspectives in regards to forming and parsing the
commands.
