Return-Path: <linux-tegra+bounces-659-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E4A8473C9
	for <lists+linux-tegra@lfdr.de>; Fri,  2 Feb 2024 16:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C1D9B29CC7
	for <lists+linux-tegra@lfdr.de>; Fri,  2 Feb 2024 15:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F52F14690C;
	Fri,  2 Feb 2024 15:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uoDxafE6"
X-Original-To: linux-tegra@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647831474CE
	for <linux-tegra@vger.kernel.org>; Fri,  2 Feb 2024 15:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706889425; cv=fail; b=HnWOu0B+qWv7kmQ2IoMiNiYquhsrWmH14LZ6XulobWJCxa11omSfhLsQMZTiXwRm9vwEQPp8+5xNZiBvWUucEHnZhulT5IFCeQ33UCUI08zVaYh5iRrOKkBdh7HLXtBmUwW31KnACVq8Cy/zxJNcG1mYYTWKebZRoKGsbFdZ8CM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706889425; c=relaxed/simple;
	bh=1Iycm1cQhKVvtzdCwb23sdTbKTMoLLZPTHpZhobw2Xc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ji50RFi127u6SxQzW1+FpCn7GdYmmB7rJg2ptTlcfGBsS8oWEPSnVeUZkSnoX0bbBnCQn5mhzo9zzHs+Ri7WtuIjObBH/PrlDp+tsYV/y+erjwlRGJhmv0UnVN5o8uRGlCib+ZdJwhthaYFwr+jmrUDGvx/M31NJf8/Ru4XZjMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uoDxafE6; arc=fail smtp.client-ip=40.107.220.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIuOVo6JUHkdchIZUSrfGMYfgY8ENEOI4oBV6o5NDB3qOD9g9QmkhQxNjkAkBPyIlMzi1UG8Z1aHk8qg2eyBaOMJRLgXRnobWOZr9aUXz7Sld6czonYBHHvhUMvDUVVLFo7UsxUw1Py7HjF4Obbv4zwtSMkO1QfXs3hHy+cY7dwTn+AWTOG94aLLY7AZJz1QzKwqapBejOCf+C/BuS/dCjO85TsQTCVR4AL6mvSBeCTUI9kBfkWbB7cygU4buYwCH6hDOgMNJolS6BT2Naw5dofJXlClARu0FdbFkCJPTtvPoy2Bw3XaR1dOfp8GaOzeP/s0hPvXXUe/vcPYxpO1Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdoaPxaXCBII7sU43yBw7mm2qfGi6D+udo1iro0tJ5M=;
 b=FXBuMnRx94d20K+uyOMnUmbou8oBAj4XsdV0L2jSV63Tbq1cgYyL9MVJq4Y00IzuEwyb9eS0Lm59FxNKX0uLZsEy9c9/pVxLap1Ont3Pq50UMcVJd/eIaX/l+BMfIBDx7HCwNvbQszvTYslqStiFRF81RP2+biczVXBjxHUsDHRviIX0Z0v35LNUflvrjQr6DSJrXOwsTyJjqPygH2YZ0ri4BBCBsNHMHUax7xp6X8kz5LVrC0axaUEq2BGrQW7cMCMb3oak4hfXRT5Lk165BGk+LtUtDGX9VJB8t1x4oidbZhQJ4KsTsvfhunEdejG7UyLivgVcxPaJmgNfMCByhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdoaPxaXCBII7sU43yBw7mm2qfGi6D+udo1iro0tJ5M=;
 b=uoDxafE65HP5I+u7ZCxHC3XSctJh0ErwRfzL/q0zA19Z438WQhyi91sgkxLiFbXIcrnQIvsXbLrlBZg6r/E7FbgicIUJJ1bta4kivhfMklZUoRVJ64KvJN+u9Q/xou83sP7chmUF8AXAoFY/10AoFEEBB046BgkSdlnrGieqrzeYz7aiduefgs84SHrwRbtkD10UxuYzPiCv5O+FM0PapPcmP2CvHLlhpk7aNmPNAzsgqZqAIpCtEiopQpA+ujMRgL5m7L0s2pGp+GretYw8HgVJti3MKWDalP3+ivSQkrJ58AAif2oNIq90FsViyF1kjv/CjP9XLe4wWzWKeima0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 BN9PR12MB5226.namprd12.prod.outlook.com (2603:10b6:408:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.12; Fri, 2 Feb
 2024 15:56:59 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::acb6:8bd8:e40b:2bfe]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::acb6:8bd8:e40b:2bfe%3]) with mapi id 15.20.7270.010; Fri, 2 Feb 2024
 15:56:59 +0000
Message-ID: <361dcaf5-352e-4162-a952-c690783a2251@nvidia.com>
Date: Fri, 2 Feb 2024 15:56:52 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tegra: Remove of_dma_configure() from
 host1x_device_add()
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, patches@lists.linux.dev
References: <0-v1-c76c50cd425e+15298-host1x_no_iommu_conf_jgg@nvidia.com>
 <583b9145-cbbe-4a03-8120-e2a66a6093c7@nvidia.com>
 <20240131153312.GM1455070@nvidia.com>
 <a1597113-3ec9-445c-90d1-62df97406fb2@nvidia.com>
 <20240201200212.GQ1455070@nvidia.com>
 <96bc6d37-1000-4651-9a26-a8446dd64803@nvidia.com>
 <20240202143518.GS1455070@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20240202143518.GS1455070@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0566.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::16) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|BN9PR12MB5226:EE_
X-MS-Office365-Filtering-Correlation-Id: 73147227-c86f-45ac-aa79-08dc24079677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0sNooi5aWbe6NdjqiViTGRr4FEzOaDV8eWKJBknHMxZvvesy25PS6oDzUv0HqrYQY1xAC0ecX2Wbuxy6ZBVezf8DOaGM7ppi5SXm6zXTQGH+g97ruzQ8qpubSxDDLKQE5pCkgs7v4rec3TJU1urwX7aTvLQyKy9p6B+w8Y+opROgRX5wFayFIqRulrevRgAWt0cK6bZHElYkOEAXuLqoVFeNf6Dmozwwe8UpYNsOCXyTWMKaF/9SMWNjLvIMsrgopeC0fgrYP85jkVQJ5Q7R1iKueC1eO5gUUcG5KHTUywC2wFqRwn17SVip0oe3Coh68bKX6/WKLr7Rp9fBygapeYRsyuw6O2dlKz2Bnprhum1s8Wtd4SKtM8U2DQanHKK5YgIZhUrERHi3q+3qK0xL5+a6jL5ho13nYduQGpfUCvwR1oLZ+G5kjR+RNqdgqzvi/CanJDz617+p3NJLLgjJhqXGIhrmMQbCLVRLxUIPmW5Gz//vkLk2tnPxrhSSPiccrKn21jFEAd0zyKGV04cv7VI+uxnpz6JI8r9IZBcXTzraUKo0QsUO66xiZxvwzuP/lQyyJxw0a81Km89k4shEZ+EN6cqb4PqPJ3hkrQ5UNwo3P9RwUKXEFFEPaWmo2/g3axq1o4wLx413tYBZXH+icFG6IqnAg5bQvH8Ny4HprU4b9qz/xtfebtquavVu77/1wEbLFVVICdD09U64X9kahCHZKt4vQSKH/dQeAeduK9w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(136003)(346002)(376002)(230273577357003)(230173577357003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(41300700001)(26005)(2616005)(31686004)(6486002)(36756003)(478600001)(6666004)(6512007)(83380400001)(6506007)(38100700002)(53546011)(55236004)(8936002)(66946007)(31696002)(37006003)(5660300002)(86362001)(54906003)(316002)(6636002)(66556008)(4744005)(2906002)(6862004)(4326008)(66476007)(8676002)(45980500001)(43740500002)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGJKUGJSRGdZT1N0aldwSE0xNkNqMk56blVkck4raFZSK1g4ZkQ4R2M0VHhz?=
 =?utf-8?B?ZDR0MzVQQkpPQ003Nk9OWGh1OGFDSHFmWXh4TkhkZ3plZUFTRjBpSkJhLzE0?=
 =?utf-8?B?NjVQcXNlaEYvT0hEV3ZzczdEYXBPMVNvUFhTNFpSdUZjYndIUXEvQ3VxMnJU?=
 =?utf-8?B?NGlqQU9GL0J3QkN6NnE3NExsR1lESzR4ZW53SnNFVnpLQ0xBaS9UYXNORjl5?=
 =?utf-8?B?T3VNM0xpSkdqN1l4UzU0VEw0UWhlUVU2RnBLOGhqRTFCbGFpTGhOdkFIdEFx?=
 =?utf-8?B?blJ5TzNGczFpajQybFlKT1pNU3pFMk5JN0F6TktZNnRlbGxDN3FORWgzYll2?=
 =?utf-8?B?K0Z4eUFzTTg4WjBCSVBIU1VyMTZOYkV4cHl1azBuUjVmYm1lM1pabnJNVTRF?=
 =?utf-8?B?TEZtTDRFRzdQZjgvRHNOUGY2NXpMTmJtZHZtdTlTZmcxWktMd0NLYmxGdGdO?=
 =?utf-8?B?b2pPb1NrVk4wWFY0OU9DVmhtN0R0MnNVVWNOYzVSSTB6aEFWVUtUUU1vVlY0?=
 =?utf-8?B?TmdSMVZXYlBtSmNGUlp2UEZ6RjBTM3BFNUZnRjQ1N3dwNDNSTVBUcWhkemdo?=
 =?utf-8?B?S1hBc25VRWhHR3dVUEtUL2Fvc0dmUGxhY2sxZ21paEV3NG9LZk54ODducTB2?=
 =?utf-8?B?dURvK29yQzB6V0I2dFdwUjRpNmZNNXVGbUFNczVOSmhTUTN3dTR3eHErVFlB?=
 =?utf-8?B?S1pxcE0vYWdJYm9GTllXenpZdmV3R3dqOTU0cExJRHVWQzBGS25OMWt4b0hV?=
 =?utf-8?B?NTdMWTJNMDVoek9ISXNsVWZaTEZ0S3dWOHdRZUI2a3FyM2p1ampNR2REZlJ4?=
 =?utf-8?B?UUZkOGkxRXpWSUEwMG15QURaeUpOaXNZN20rQmNUTFVNWG80MkZPTVdhT29B?=
 =?utf-8?B?WDAwWE4wVkdUa0M5VTlSYWdSOVRGOHNOVmF2Y0tGV291bWZ6Y0VJVTdWUXRT?=
 =?utf-8?B?enhLSjhBOWZkSGtLdTE0dGJ6Vnp1dFpuT0dOTGtCSWpuRktMc25maHFlc2Vh?=
 =?utf-8?B?eWlRbU5GTEh0NFhpZnFOZERWazVTSmlXaWU2OW1qUFF5ZFRlaXFrbnMwbEZk?=
 =?utf-8?B?d3NoOUxsbjBMQlRCb3ZDQ1JFd3Q5aVVJcXpoMFpFQ1NLU0x2ZzJ0U3pPR1Bh?=
 =?utf-8?B?V2FzNXFzQzZZS2VVNmVNWDkzaHY5cDlRMHhmRHoxSVBSM1orV2ovNERSWnpo?=
 =?utf-8?B?QnEwTURxWDdVM1VnVjJma2JVd25Dd0pvVTFOeHBBRDVkOHZTVGFaM3lwZjhR?=
 =?utf-8?B?RXQycUZSNzFJRUx4YmdNVjFOUFYrT0QwcnhBU2xrcFZQb0hWQUNOc01xYXlm?=
 =?utf-8?B?S3pGVzBaNC9JUm5VMkRIRmEra1JnVlhralllU0oyMXdlMFE0QjlhaElabmpZ?=
 =?utf-8?B?cmZTVGFoWG9hdnQzcGpScTdGOWM5bEFJQUhlK1FCUVNQZDM1NE5SbTNQQUMy?=
 =?utf-8?B?d05RY0FnQUVnQUNzUmtvMVNWcU1WVm1PSGdSTy83Sk5WUWdmVWJENUQrMG01?=
 =?utf-8?B?RXB1VXBHRWFDajZHMyt6RnZlT2ZheU1BSzNsY3QrQkNLd2hudmt2cjFZNGs0?=
 =?utf-8?B?cEI3M1BobXdqa21ZWldJUnhNbk51bHovOEovUVROOWgzZmRYS0J4azcvTUU1?=
 =?utf-8?B?azFEYkZnTDJxelN4a1hSU1QzYjFrREw3ZSt3Q2UzODJoUFc3SWNWVmhCOWhq?=
 =?utf-8?B?dkFZVWovUmZZZHZSNlhBSlRyRTVMT2RPRW9ES1FRdGU3L3RmVnN6VWg4eVVy?=
 =?utf-8?B?bDlIZnBEVjJPRjcyck4wWUcxek53ZlVMZE4wZmx5TVMyL0tHS2tBc2liZ1Qx?=
 =?utf-8?B?MEhDQzFOejczaWtPVHpJa01oKzVZT1pDdVFTeGVFU3NrMk52aEFHTzBNTEdm?=
 =?utf-8?B?bzRvR2txMXhVYnRoVGJYRFVNREU5dEtRUDVzdFNPSWhnWFRJOE9hWnViNWw5?=
 =?utf-8?B?ZjU5MFRDZ0s2cFlLbTEwMFJhOE9oZGlwa3JQSjhjdWsyTUJKTm5LVWtFYVdD?=
 =?utf-8?B?TjVVWk00TUxWWXhseTdTaUVOZ0F0NGpzY3dmYnJKQnB4S3QzYUdNWk9LUGdY?=
 =?utf-8?B?S2w4MkNIRUhub0l1Zm5xYUpFTFA1ZVVmUnBNRFZuTFRoeDZKakRGU0JXK2Nk?=
 =?utf-8?B?K1ZRR2Y5V3dQMkx2bGFxTUJxN2E1L0Y2SEJPVFRmWlg2K0hmYmU3amJodVVC?=
 =?utf-8?B?UlE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73147227-c86f-45ac-aa79-08dc24079677
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 15:56:59.0179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7LSKJ2nS6WhlXXOCQrIJ71Ei9UrC7H2Pgxa5zC4lUVDFJPTS40h8B7HIuLkjSBMu+RrgjagEC1QnKwDTlYofOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5226


On 02/02/2024 14:35, Jason Gunthorpe wrote:
> On Fri, Feb 02, 2024 at 10:40:36AM +0000, Jon Hunter wrote:
> 
>>> But, what is the actual log output you see, is it -EEXIST?
>>
>> I see ...
>>
>>   ERR KERN host1x drm: iommu configuration for device failed with -ENOENT
> 
> So that shouldn't happen in you case as far as I can tell, the device
> is properly added, link->kobj should be fine and ENOENT shouldn't
> happen.
> 
>>> If it is coming and going is it a race of some kind?
>>
>> It is consistent without the above. However, I did not think that the
>> above change would change the returning on -ENOENT? I will add more
>> debug.
> 
> I do not think it can either
> 
> Still wonder if there is some odd race..
> 
> Let me know when you figure out what is happening - I think there is
> some bug here it is not just a harmless warning.


Yes looks like a race of some sort. Adding a bit of debug also makes the 
issue go away so difficult to see what is happening.

Jon

-- 
nvpublic

