Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4181D72C8C2
	for <lists+linux-tegra@lfdr.de>; Mon, 12 Jun 2023 16:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232814AbjFLOis (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 12 Jun 2023 10:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbjFLOiq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 12 Jun 2023 10:38:46 -0400
X-Greylist: delayed 564 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 12 Jun 2023 07:38:43 PDT
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E48AC4
        for <linux-tegra@vger.kernel.org>; Mon, 12 Jun 2023 07:38:42 -0700 (PDT)
Received: from ugly.fritz.box (localhost [127.0.0.1])
        by bluemchen.kde.org (Postfix) with ESMTP id 789E224236;
        Mon, 12 Jun 2023 10:28:36 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
        id 1q8iX6-QHG-00; Mon, 12 Jun 2023 16:28:36 +0200
Date:   Mon, 12 Jun 2023 16:28:36 +0200
From:   Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: Re: [PATCH] ALSA: pcm: fix wait_time calculations
Message-ID: <ZIcrlOSlA233SC2y@ugly>
References: <20230405201219.2197774-1-oswald.buddenhagen@gmx.de>
 <b57c46a6-4446-3418-fc4a-8bef1e28868c@nvidia.com>
 <76082a48-508b-e5cf-6ae0-66c265ecfdd7@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <76082a48-508b-e5cf-6ae0-66c265ecfdd7@nvidia.com>
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jun 12, 2023 at 02:16:15PM +0100, Jon Hunter wrote:
>On 12/06/2023 13:18, Jon Hunter wrote:
>> On 05/04/2023 21:12, Oswald Buddenhagen wrote:
>>> ... in wait_for_avail() and snd_pcm_drain().
>> 
>> Sorry for not catching this sooner, but I have just noticed that one of 
>> our audio tests for Tegra is failing on v6.4-rc and bisect is pointing 
>> to this commit. Reverting this on top of the current mainline fixes it.
>> 
>If I enable the debug prints, I do see the following messages ...
>
>  tegra-audio-graph-card sound: capture read timeout (DMA or IRQ trouble?)
>
yes, this is the kind of fallout one would expect from this change, as 
it significantly shortened the effective timeout under most 
circumstances.

first check that there isn't a genuine underlying bug, that is, that the 
unusually slow timings match expectations.

if everything looks right, then properly codify the timeout in the 
driver by setting substream->wait_time as required.
the lazy approach of more or less restoring the previous status quo 
would be setting it to 10000 in the `open` callback.
fwiw, soc/sof sets it to 500, which may actually be a bad idea (it's 
short enough that a very long period time would exceed it, if such is 
permitted). and it's not obvious why it does that.

regards
