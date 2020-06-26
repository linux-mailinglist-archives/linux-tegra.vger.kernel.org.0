Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0189320B04B
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Jun 2020 13:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728263AbgFZLQZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 26 Jun 2020 07:16:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42060 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728247AbgFZLQZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Jun 2020 07:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593170184;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=HkhDlOlW15GcjS67EXQs7c+Yrqk9uWab/aSSjGFcGHQ=;
        b=ihmsKG9mlwQgz8gvMBM1wKc0u5ufM7+NYDKHE2t9VT20rcxVFdTuzLOC9ikqLG719aHsxD
        G0mxsjh0q21W/rTxX4iBaVd1jnS5Uc6B7nUTxs/FxbY4qYMDermSuj3CLARr94DxJXBr6X
        V+3Ki00V1O9nD1h/zze690/zx6LDpn4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-OPRlaTpCO9in_A11zKgFTw-1; Fri, 26 Jun 2020 07:16:22 -0400
X-MC-Unique: OPRlaTpCO9in_A11zKgFTw-1
Received: by mail-qk1-f199.google.com with SMTP id k1so3117236qko.14
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2020 04:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HkhDlOlW15GcjS67EXQs7c+Yrqk9uWab/aSSjGFcGHQ=;
        b=t19q56iYUCVGknNuHPsdKeJ/wup1XmV2FN6lCjAY2rXw1yU0aGr4C59YWrGJXFSN7L
         +xDi8jrDh9K5EebXqiBbc2tYSHjB0xLoqNi/izr07xp6R+F/lMJ3ymMKYC1QE4iYtIrx
         tWuz+gPYCnSgp6pEeMY65YOVJMIcmjLsbtA04eVSGGIYxca+CM3esCTMzvyfSzAHwc2l
         EPnKSR3q4UfWCPKftl3NkevYmZwnrVtOCYKCDNRyqXBmC7WB8Q5DwWEPa1nWB1AVzb7j
         pnyUV2559WKh8yBMMHxLD+2RA2EbH/sJgidkZu0leAhgb8nbV2tVN9STMKXwyq3s2fjU
         jV/g==
X-Gm-Message-State: AOAM531FCorMlSSozjmnT5i4ZLdctwrEw0coNAajbwHa131vOEm0Wa2j
        j9yNrKkNlEfv/yy1ZcpeP6JeNIukhHmwdD/fMBwLgicCpmN025i3Q5x5OhaI6CdIILhrlY69N8b
        lvqf6jWy2PclN4SIwX5lQpziY3sXXCHDJeD8dzUU=
X-Received: by 2002:a37:5c04:: with SMTP id q4mr2246183qkb.192.1593170182010;
        Fri, 26 Jun 2020 04:16:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxomVJsOcRLn/iwujMFquBZjYpNN0p2Dht5n6r/Fh8IScZIZzSYQnDQd46u9pQeeJBFRRlp8olv6TkrJKGc8dY=
X-Received: by 2002:a37:5c04:: with SMTP id q4mr2246168qkb.192.1593170181820;
 Fri, 26 Jun 2020 04:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <CACO55ttfwQDwnO8ep=YKBgo+HYBg=zLDLfBKtH67MrqKzMWw_w@mail.gmail.com> <cb935527-2eb9-23f3-a823-d6b849fc3c94@kapsi.fi>
In-Reply-To: <cb935527-2eb9-23f3-a823-d6b849fc3c94@kapsi.fi>
From:   Karol Herbst <kherbst@redhat.com>
Date:   Fri, 26 Jun 2020 13:16:10 +0200
Message-ID: <CACO55tstj7owhL_Go+ZFLZW4TnzN_GtnKn5iKQOSqWP5bJw_sA@mail.gmail.com>
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        gustavo@padovan.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        talho@nvidia.com, bhuntsman@nvidia.com,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jun 26, 2020 at 1:13 PM Mikko Perttunen <cyndis@kapsi.fi> wrote:
>
> On 6/26/20 2:06 PM, Karol Herbst wrote:
> > On Tue, Jun 23, 2020 at 3:03 PM Mikko Perttunen <cyndis@kapsi.fi> wrote:
> >>
> >> # Host1x/TegraDRM UAPI proposal
> >>
> >> This is a proposal for a stable UAPI for Host1x and TegraDRM, to replace
> >> the current TegraDRM UAPI that is behind `STAGING` and quite obsolete in
> >> many ways.
> >>
> >> I haven't written any implementation yet -- I'll do that once there is
> >> some agreement on the high-level design.
> >>
> >> Current open items:
> >>
> >> * The syncpoint UAPI allows userspace to create sync_file FDs with
> >> arbitrary syncpoint fences. dma_fence code currently seems to assume all
> >> fences will be signaled, which would not necessarily be the case with
> >> this interface.
> >> * Previously present GEM IOCTLs (GEM_CREATE, GEM_MMAP) are not present.
> >> Not sure if they are still needed.
> >>
> >
> > Hi, as this wasn't addressed here (and sorry if I missed it): is there
> > an open source userspace making use of this UAPI? Because this is
> > something which needs to be seen before it can be included at all.
> >
>
> Hi Karol,
>
> not currently, but once we have hashed out the design a little bit (and
> I'm back from vacation), I'll work on open source userspace and
> converting existing code using the staging UAPI to this one.
>
> Mikko
>

okay, cool, sounds good!

